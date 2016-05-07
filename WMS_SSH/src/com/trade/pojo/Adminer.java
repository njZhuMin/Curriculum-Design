package com.trade.pojo;



/**
 * Adminer entity. @author MyEclipse Persistence Tools
 */

public class Adminer  implements java.io.Serializable {


    // Fields    

	/*
	 * 	编号
	 * 	登录帐号
	 * 	登录密码
	 * 	姓名
	 * 	电话
	 * 
	 * */
     private Integer adminerId;
     private String AIdcard;
     private String APwd;
     private String AName;
     private Integer AStyle;


    // Constructors

    /** default constructor */
    public Adminer() {
    }

    
    /** full constructor */
    public Adminer(String AIdcard, String APwd, String AName, int AStyle) {
        this.AIdcard = AIdcard;
        this.APwd = APwd;
        this.AName = AName;
        this.AStyle= AStyle;
    }

   
    // Property accessors

    public Integer getAdminerId() {
        return this.adminerId;
    }
    
    public void setAdminerId(Integer adminerId) {
        this.adminerId = adminerId;
    }

    public String getAIdcard() {
        return this.AIdcard;
    }
    
    public void setAIdcard(String AIdcard) {
        this.AIdcard = AIdcard;
    }

    public String getAPwd() {
        return this.APwd;
    }
    
    public void setAPwd(String APwd) {
        this.APwd = APwd;
    }

    public String getAName() {
        return this.AName;
    }
    
    public void setAName(String AName) {
        this.AName = AName;
    }


	public Integer getAStyle() {
		return AStyle;
	}


	public void setAStyle(Integer aStyle) {
		AStyle = aStyle;
	}

}