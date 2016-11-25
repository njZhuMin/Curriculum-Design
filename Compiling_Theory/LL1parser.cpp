#define TRUE 1
#define FALSE 0

#include <iostream>
#include <map>
#include <vector>
#include <fstream>
#include <algorithm>
#include <set>
#include <sstream>
#include <stack>

using namespace std;

map<string, vector<string> > rules;
vector<string> nonTerminals;
set<string> terminals;
map<string, set<string> > firstSet;
map<string, set<string> > followSet;
int letter = 16;

void removeIndirectLeftRecursion();

void removeDirectLeftRecursion();

void leftFactoring();

int findLongestPrefix(int x);

void findFirstSets();

bool produceEpsilon(string str);

bool isNonTerminal(string str);

void findFollowSets();

void printGrammar();

vector<string> split(string s, char delim, vector<string> &elems);

int main(int argc, char **argv) {
    ifstream infile;
    string rule;
    string left, right;

    vector<string>::iterator it;
    if (argc != 2) {
        cout << "Usage: ./LL1parser grammar_file." << endl;
        return -1;
    }
    infile.open(argv[1], ifstream::in);

    while (getline(infile, rule)) {
        //cout << rule << endl;
        int i;
        i = 0;
        while (rule[i] != ':') {
            left = left + rule[i];
            i++;
        }
        i++;
        while (i != rule.length()) {
            right = right + rule[i];
            i++;
        }
        //cout << left << endl;
        //cout << right << endl;

        rules[left].push_back(right);

        it = find(nonTerminals.begin(), nonTerminals.end(), left);
        if (it == nonTerminals.end())
            nonTerminals.push_back(left);

        left = "";
        right = "";

    }
    infile.close();

    cout << "Original Grammar-->" << endl;
    printGrammar();
    //cout << nonTerminals.size() << endl;
    //cout << rules.size() << endl;
    cout << "---------------------------------" << endl;

    cout << "Grammar After Indirect Left Recursion is Eliminated-->" << endl;
    removeIndirectLeftRecursion();

    printGrammar();
    cout << "---------------------------------" << endl;

    //cout << nonTerminals.size() << "---------------------------------" << endl ;


    removeDirectLeftRecursion();
    cout << "Grammar After Direct Left Recursion is Eliminated-->" << endl;
    printGrammar();

    //cout << "Gone " << endl;
    cout << "---------------------------------" << endl;

    leftFactoring();

    cout << "After Left Factoring" << endl;
    printGrammar();

    findFirstSets();
    findFollowSets();

    cout << "--------------------------------" << endl;

    string parsingTable[nonTerminals.size()][terminals.size() + 1];


    int i, j;
    set<string>::iterator iter;
    vector<string> terminals_temp;

    for (i = 0; i < nonTerminals.size(); i++)
        cout << i << "-->" << nonTerminals[i] << endl;
    for (j = 0, iter = terminals.begin(); iter != terminals.end(); j++, iter++) {
        terminals_temp.push_back(*iter);
        cout << j << "-->" << *iter << endl;
    }
    terminals_temp.push_back("$");
    cout << "--------------------------------" << endl;
    cout << "Parsing Table" << endl << endl;

    for (i = 0; i < nonTerminals.size(); i++) {
        for (j = 0; j < terminals_temp.size(); j++)
            parsingTable[i][j] = "";
    }

    for (i = 0; i < nonTerminals.size(); i++) {
        for (it = rules[nonTerminals[i]].begin(); it != rules[nonTerminals[i]].end(); it++) {
            //cout << "Rule-->" << nonTerminals[i] << ":" << *it << endl;
            vector<string> temp;
            vector<string>::iterator x;
            split(*it, ' ', temp);
            set<string>::iterator it_s;
            for (x = temp.begin(); x != temp.end(); x++) {
                //cout << *x << endl;
                for (it_s = firstSet[*x].begin(); it_s != firstSet[*x].end(); it_s++) {
                    if (*it_s != "#") {
                        for (j = 0; j < terminals_temp.size(); j++) {
                            if (terminals_temp[j] == *it_s)
                                //parsingTable[i][j].push_back(*it);
                            {
                                if (parsingTable[i][j] == "") {
                                    //cout << "Inserted " << *it << " " << nonTerminals[i] << " " << terminals_temp[j] << endl;
                                    parsingTable[i][j] = *it;
                                } else {
                                    //cout << "Returned" << endl;
                                    cout << "Grammar not LL(1)" << endl;
                                    exit(1);
                                }
                            }
                        }
                    }
                }
                if (firstSet[*x].find("#") == firstSet[*x].end()) {
                    //cout << "Break! " << *x << endl;
                    break;
                }
            }

            for (x = temp.begin(); x != temp.end(); x++) {
                if (firstSet[*x].find("#") == firstSet[*x].end()) {
                    //cout << "Broken! " << *x << endl;
                    break;
                }
            }
            if (x == temp.end()) {
                for (it_s = followSet[nonTerminals[i]].begin(); it_s != followSet[nonTerminals[i]].end(); it_s++) {
                    for (j = 0; j < terminals_temp.size(); j++) {
                        if (terminals_temp[j] == *it_s)
                            //parsingTable[i][j].push_back(*it);
                        {
                            if (parsingTable[i][j] == "") {
                                //cout << "Inserted1 " << *it << " " << nonTerminals[i] << " " << terminals_temp[j] << endl;
                                parsingTable[i][j] = *it;
                            } else {
                                //cout << "From Here" << endl;
                                cout << "Grammar not LL(1)" << endl;
                                exit(1);
                            }
                        }
                    }
                }
            }
        }
    }

    //cout << endl;
    for (i = 0; i < nonTerminals.size(); i++) {
        for (j = 0; j < terminals_temp.size(); j++) {
            if (parsingTable[i][j] == "")
                cout << "ERR\t";
            else
                cout << parsingTable[i][j] << "\t";
        }
        cout << endl;
    }
    cout << "--------------------------------" << endl;
    //string s;
    //s = parsingTable[0][5][0];
    //cout << s ;

    string input;
    cout << "Enter an input string:" << endl;
    getline(cin, input);
    //cout << input << endl;

    vector<string> inp_split;
    split(input, ' ', inp_split);
    inp_split.push_back("$");

    vector<string>::iterator it_inp;
    stack<string> t;
    int k;
    t.push("$");
    t.push(nonTerminals[0]);

    /*it_inp = inp_split.begin();
    for( ; it_inp != inp_split.end(); it_inp++)
        cout << *it_inp << endl;
    */
    it_inp = inp_split.begin();

    while (1) {
        cout << "TOP--> " << t.top() << " INPUT--> " << *it_inp << endl;
        if (*it_inp == "$" && t.top() == "$") {
            cout << "Accepted" << endl;
            break;
        }
        if (t.top() != "$" && terminals.find(t.top()) != terminals.end()) {
            t.pop();
            it_inp++;
        } else {
            for (i = 0; i < nonTerminals.size(); i++) {
                if (nonTerminals[i] == t.top())
                    break;
            }
            for (j = 0; j < terminals_temp.size(); j++) {
                if (terminals_temp[j] == *it_inp)
                    break;
            }
            //cout << "I--> " << i << " J--> " << j << endl;
            if (parsingTable[i][j] == "") {
                cout << "Rejected" << endl;
                break;
            } else {
                //cout << "Inside" << endl;
                t.pop();
                string str;
                vector<string> str_v;
                str = parsingTable[i][j];
                //cout << "Entry--> " << str << endl;
                if (str != "#") {
                    split(str, ' ', str_v);
                    for (k = str_v.size() - 1; k >= 0; k--)
                        t.push(str_v[k]);
                }
            }
        }
    }
    return 0;
}

void printGrammar() {
    for (int i = 0; i < nonTerminals.size(); i++) {
        for (int j = 0; j < rules[nonTerminals[i]].size(); j++) {
            cout << nonTerminals[i] << "\t" << rules[nonTerminals[i]][j] << endl;
        }
    }
}

void removeIndirectLeftRecursion() {
    int pos;

    string str, temp, newrule;
    vector<string>::iterator it;

    for (int i = 0; i < nonTerminals.size(); i++) {
        for (int j = 0; j < i; j++) {
            for (int k = 0; k < rules[nonTerminals[i]].size(); k++) {
                pos = rules[nonTerminals[i]][k].find(nonTerminals[j]);
                if (pos == rules[nonTerminals[i]][k].npos);
                else if (pos == 0) {
                    str = rules[nonTerminals[i]][k];
                    temp = str.substr(pos + nonTerminals[i].length() + 1);

                    it = find(rules[nonTerminals[i]].begin(), rules[nonTerminals[i]].end(), str);
                    rules[nonTerminals[i]].erase(it);

                    for (int l = 0; l < rules[nonTerminals[j]].size(); l++) {
                        newrule = rules[nonTerminals[j]][l] + " " + temp;
                        rules[nonTerminals[i]].push_back(newrule);
                    }
                }
            }
        }
    }
}

void removeDirectLeftRecursion() {
    string s;
    s = letter;
    //cout << s;

    int i, j, k;
    int pos, count = 0;

    string temp, str;

    vector<string>::iterator it;
    vector<string> x, y, z;
    bool found = FALSE;

    for (i = 0; i < nonTerminals.size(); i++) {
        s = letter;
        //cout << "Non Terminal " << nonTerminals[i] << endl;
        count = 0;

        for (j = 0; j < rules[nonTerminals[i]].size(); j++) {
            //cout << "RHS " << rules[nonTerminals[i]][j] << endl;
            pos = rules[nonTerminals[i]][j].find(nonTerminals[i]);

            if (pos == rules[nonTerminals[i]][j].npos)
                //cout << "Not Found" << endl;
                ;
            else if (pos == 0) {
                found = TRUE;
                //cout << "Mil Gaya " << found << endl;
                temp = rules[nonTerminals[i]][j];        //Rule to be removed
                //cout << temp << endl;
                str = temp.substr(pos + nonTerminals[i].length() + 1);
                x.push_back(str);
                y.push_back(temp);
                if (count == 0)
                    letter++;
                count++;
            }
        }

        if (found == TRUE) {
            for (k = 0; k < y.size(); k++) {
                it = find(rules[nonTerminals[i]].begin(), rules[nonTerminals[i]].end(), y[k]);
                rules[nonTerminals[i]].erase(it);
            }

            for (k = 0; k < rules[nonTerminals[i]].size(); k++) {
                rules[nonTerminals[i]][k] = rules[nonTerminals[i]][k] + " " + s;
            }
            for (k = 0; k < x.size(); k++) {
                rules[s].push_back(x[k] + " " + s);
            }
            rules[s].push_back("#");
        }
        x.clear();
        y.clear();
        found = FALSE;
    }

    //cout << "Aditya " << letter << endl;
    for (int t = 16; t < letter; t++) {
        s = t;
        nonTerminals.push_back(s);
    }
}

string longPrefix;

int findLongestPrefix(int x) {
    int size = rules[nonTerminals[x]].size();
    int oldSize = 0, newSize = 0;
    longPrefix = "";
    string seq;
    for (int i = 0; i < size; i++) {
        vector<string> temp_i;
        split(rules[nonTerminals[x]][i], ' ', temp_i);
        for (int j = i + 1; j < size; j++) {
            vector<string> temp_j;
            split(rules[nonTerminals[x]][j], ' ', temp_j);
            vector<string>::iterator iter_j, iter_i;

            for (iter_i = temp_i.begin(), iter_j = temp_j.begin();
                 iter_i != temp_i.end() && iter_j != temp_j.end(); iter_i++, iter_j++) {
                //cout << "ITER_I " << *iter_i << " ITER_J " << *iter_j << endl;
                if (*iter_i == *iter_j) {
                    seq = seq + *iter_i + " ";
                    newSize++;
                } else
                    break;
            }
            if (oldSize < newSize) {
                //cout << "Seq " << seq << endl;
                oldSize = newSize;
                longPrefix = seq;
            }
        }
    }
    return oldSize;
}

void leftFactoring() {
    int i, j, k, l;

    int longestPrefixLength;

    string newNonTerminal;

    for (i = 0; i < nonTerminals.size(); i++) {
        int count = 0;
        while (count != 999) {
            longPrefix = "";
            longestPrefixLength = findLongestPrefix(i);
            //cout << "Loong " << longestPrefixLength << endl;
            string seq = longPrefix;
            if (longestPrefixLength > 0) {
                newNonTerminal = letter;
                string newRule = "";
                letter++;
                int flag = 0;

                //cout << "Reached " << rules[nonTerminals[i]].size() << endl;
                int q = rules[nonTerminals[i]].size();
                //cout << endl;
                //for(j=0;j<q;j++) cout << "\t" << rules[nonTerminals[i]][j] << "\t";
                //cout << endl;
                for (j = 0; j < q; j++) {
                    //cout << "J " << j << endl;
                    string str = rules[nonTerminals[i]][j];
                    //cout <<"Old Rule-->" << str << endl;
                    string temp;
                    temp = seq.substr(0, seq.length() - 1);
                    if (str.compare(0, seq.length() - 1, temp) == 0) {
                        //cout << "Compared-->" << temp<<"temp" << endl;
                        string oldRule = rules[nonTerminals[i]][j];
                        if (flag == 0) {
                            newRule = seq + newNonTerminal;
                            flag = 1;
                        }
                        //cout << "Rule removed " << *(rules[nonTerminals[i]].begin() + j) << endl;
                        rules[nonTerminals[i]].erase(rules[nonTerminals[i]].begin() + j);
                        j = -1;
                        q--;
                        string remainRule = oldRule.substr(seq.length() - 1, oldRule.length());
                        if (remainRule == "")
                            remainRule = "#";
                        else if (remainRule[0] == ' ')
                            remainRule = remainRule.substr(1, remainRule.length());
                        //cout << "Remaining Rule-->" << remainRule << endl;
                        rules[newNonTerminal].push_back(remainRule);
                    }

                }
                rules[nonTerminals[i]].push_back(newRule);
                nonTerminals.push_back(newNonTerminal);
                count++;
            } else
                count = 999;
        }
    }
}


void findFirstSets() {
    int i, j, k;
    bool result;
    vector<string>::iterator pos;
    vector<string> t;
    set<string>::iterator it;
    map<string, set<string> >::iterator xy;

    for (i = 0; i < nonTerminals.size(); i++) {
        for (k = 0; k < rules[nonTerminals[i]].size(); k++) {
            split(rules[nonTerminals[i]][k], ' ', t);

            for (j = 0; j < t.size(); j++) {
                //cout << "Split " << t[j] << endl;
                pos = find(nonTerminals.begin(), nonTerminals.end(), t[j]);
                if (pos == nonTerminals.end()) {
                    firstSet[t[j]].insert(t[j]);
                    terminals.insert(t[j]);
                }
            }
        }
        result = produceEpsilon(nonTerminals[i]);
        if (result)
            firstSet[nonTerminals[i]].insert("#");
        //cout << nonTerminals[i] << "S-->" << result << endl;

        t.clear();
    }

    t.clear();

    vector<string>::iterator iter, iter_v;

    //cout << "Before while()" << endl;

    /*for(xy = firstSet.begin(); xy != firstSet.end(); xy++)
    {
        cout << xy->first << "--> ";
        for(it = xy->second.begin(); it != xy->second.end(); it++)
        {
            cout << *it << "\t";
        }
        cout << endl;
    }*/


    result = TRUE;

    while (result) {
        result = FALSE;

        //cout << "New Iteration" << endl;
        for (iter = nonTerminals.begin(); iter != nonTerminals.end(); iter++) {
            for (iter_v = rules[*iter].begin(); iter_v != rules[*iter].end(); iter_v++) {
                //cout << *iter << ":" << *iter_v << "Aditya" << endl;
                vector<string> temp;
                vector<string>::iterator it_temp;
                split(*iter_v, ' ', temp);
                for (it_temp = temp.begin(); it_temp != temp.end(); it_temp++) {
                    if (isNonTerminal(*it_temp)) {
                        if (!produceEpsilon(*it_temp)) {
                            set<string>::iterator it_s;
                            if (firstSet.find(*it_temp) != firstSet.end()) {
                                for (it_s = firstSet[*it_temp].begin(); it_s != firstSet[*it_temp].end(); it_s++) {
                                    if (firstSet[*iter].find(*it_s) == firstSet[*iter].end())
                                        result = TRUE;
                                    firstSet[*iter].insert(*it_s);
                                }
                                //cout << "END" << endl;
                            }
                            break;
                        } else {
                            set<string>::iterator it_s;
                            if (firstSet.find(*it_temp) != firstSet.end()) {
                                for (it_s = firstSet[*it_temp].begin(); it_s != firstSet[*it_temp].end(); it_s++) {
                                    if (firstSet[*iter].find(*it_s) == firstSet[*iter].end())
                                        result = TRUE;
                                    firstSet[*iter].insert(*it_s);
                                }
                                //cout << "END else" << endl;
                            }

                        }
                        //cout << "gaya" << endl ;
                    } else {
                        if (*it_temp != "") {
                            if (firstSet[*iter].find(*it_temp) == firstSet[*iter].end()) {
                                //cout << "Insert " << *it_temp << " in first " << *iter << endl;
                                result = TRUE;
                            }
                            firstSet[*iter].insert(*it_temp);
                            break;
                        }
                    }
                }
            }
        }
    }

    //cout << "Terminals" << endl;
    //for(it = terminals.begin(); it != terminals.end(); it++)
    //	cout << *it << endl;


    cout << "---------------------------------" << endl;
    cout << "First Sets-->" << endl;

    for (xy = firstSet.begin(); xy != firstSet.end(); xy++) {
        cout << xy->first << "--> ";
        for (it = xy->second.begin(); it != xy->second.end(); it++) {
            cout << *it << " ";
        }
        cout << endl;
    }
}


vector<string> split(string s, char delim, vector<string> &elems) {
    stringstream ss(s);
    string item;
    while (getline(ss, item, delim)) {
        elems.push_back(item);
    }
    return elems;
}

bool produceEpsilon(string str) {
    //cout << "Called-->" << str << endl;
    int i, j;
    vector<string> x;
    vector<string>::iterator it;
    bool yes;

    for (i = 0; i < rules[str].size(); i++) {
        //cout << "Rules " << rules[str][i] << endl;
        if (rules[str][i] == "#") { //cout << "dir #\n";
            return TRUE;
        }
    }

    //cout << "Size" << rules[str].size();

    for (i = 0; i < rules[str].size(); i++) {
        split(rules[str][i], ' ', x);

        //cout << "Length " << rules[str][i] << " " << rules[str][i].length() << endl;
        int has;

        for (j = 0; j < x.size(); j++) {
            has = 0;
            //cout << "x[j] -->" << x[j] << endl;

            yes = isNonTerminal(x[j]);
            if (yes) {
                if (!produceEpsilon(x[j]))//{ cout << "not produce\n";
                    return FALSE;//}
                else
                    has = 1;
            } else
                break;
        }
        x.clear();
        if (has)
            return TRUE;
    }
    return FALSE;
}


bool isNonTerminal(string s) {
    vector<string>::iterator it;
    for (it = nonTerminals.begin(); it != nonTerminals.end(); it++) {
        if (*it == s)
            return TRUE;
    }
    return FALSE;
}

void findFollowSets() {
    set<string>::iterator it;
    int i, j;
    vector<string>::iterator x;
    vector<string>::iterator itnt;

    followSet[nonTerminals[0]].insert("$");

    for (itnt = nonTerminals.begin(); itnt != nonTerminals.end(); itnt++) {
        for (x = rules[*itnt].begin(); x != rules[*itnt].end(); x++) {
            vector<string> temp;
            int k;
            split(*x, ' ', temp);
            for (k = 0; k < temp.size() - 1; k++) {
                set<string>::iterator it_set;
                for (it_set = firstSet[temp[k + 1]].begin(); it_set != firstSet[temp[k + 1]].end(); it_set++) {
                    if (*it_set != "#")
                        followSet[temp[k]].insert(*it_set);
                }
            }
        }
    }


    map<string, set<string> >::iterator xy;
    set<string>::iterator z;

    /*cout << endl;
    for(xy = followSet.begin(); xy != followSet.end(); xy++)
    {
        cout << xy->first << "--> " ;
        for(z = xy->second.begin(); z != xy->second.end(); z++)
            cout << *z << " ";
        cout << endl;

    }*/

    bool result = TRUE;

    while (result) {
        result = FALSE;
        for (itnt = nonTerminals.begin(); itnt != nonTerminals.end(); itnt++) {
            for (x = rules[*itnt].begin(); x != rules[*itnt].end(); x++) {
                vector<string> temp;
                split(*x, ' ', temp);
                for (i = 0; i < temp.size() - 1; i++) {
                    for (j = i + 1; j < temp.size(); j++) {
                        if (firstSet[temp[j]].find("#") == firstSet[temp[j]].end())
                            break;
                    }
                    if (j == temp.size()) {
                        set<string>::iterator it_s;
                        if (followSet.find(*itnt) != followSet.end()) {
                            for (it_s = followSet[*itnt].begin(); it_s != followSet[*itnt].end(); it_s++) {
                                if (followSet[temp[i]].find(*it_s) == followSet[temp[i]].end())
                                    result = TRUE;
                                followSet[temp[i]].insert(*it_s);
                            }
                        }
                    }
                }
                set<string>::iterator s_it;
                if (followSet.find(*itnt) != followSet.end()) {
                    for (s_it = followSet[*itnt].begin(); s_it != followSet[*itnt].end(); s_it++) {
                        if (followSet[temp[i]].find(*s_it) == followSet[temp[i]].end())
                            result = TRUE;
                        followSet[temp[i]].insert(*s_it);
                    }
                }
            }
        }
    }

    cout << "-------------------------------------" << endl;
    cout << "Follow Sets" << endl;

    for (xy = followSet.begin(); xy != followSet.end(); xy++) {
        if (xy->first != "#") {
            cout << xy->first << "--> ";
            for (z = xy->second.begin(); z != xy->second.end(); z++)
                cout << *z << " ";
            cout << endl;
        }

    }
}
