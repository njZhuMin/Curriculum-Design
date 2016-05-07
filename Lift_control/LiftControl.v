module LiftControl(sw0,sw1,sw2,sw3,sw4,sw5,reset,k0,k1,k2,k3,CLK
                    ,Up1Dis,Up2Dis,Up3Dis,Dn2Dis,Dn3Dis,Dn4Dis,Stop1Dis,Stop2Dis
					,Stop3Dis,Stop4Dis,PosDis/*,choice*/,seg);//核心控制模块,The Top Level

    output Up1Dis,Up2Dis,Up3Dis,Dn2Dis,Dn3Dis,Dn4Dis,Stop1Dis,Stop2Dis,Stop3Dis,Stop4Dis;//向上、向下与停靠的请求显示
    output[3:0] PosDis;//楼层显示 
    output[6:0] seg;

	//input choice; 
	input sw0,sw1,sw2,sw3,sw4,sw5,reset,k0,k1,k2,k3,CLK;//向上、向下与停靠的按键输入
	
	wire clk,reset;
	
	reg DoorFlag=1'b0,blink;
	reg Up1Dis,Up2Dis,Up3Dis,Dn2Dis,Dn3Dis,Dn4Dis,Stop1Dis,Stop2Dis,Stop3Dis,Stop4Dis;
    reg[1:0] UpDnFlag=2'b00;
    reg[2:0] count;//门开后要持续4个时钟周期,用count
    reg[3:0] pos,PosDis;
    wire[6:0] seg;
    //reg speedup=1'b0;
    reg[3:0] UpReq,DownReq,StopReq;//分别用来合并向上请求的各信号，向下请求的各信号和停靠请求的各信号
    reg[6:0] LiftState=7'b0000001,NextState=7'b0000001;//分别表示电梯的当前状态和下一状态

    parameter WAIT=7'b0000001, UP=7'b0000010, DOWN=7'b0000100, UPSTOP=7'b0001000
				, DOWNSTOP=7'b0010000, OPENDOOR=7'b0100000, CLOSEDOOR=7'b1000000;
    parameter IDLE=4'b0000,FLOOR1=4'b0001, FLOOR2=4'b0010, FLOOR3=4'b0100, FLOOR4=4'b1000;
    parameter TRUE=1'b1, FALSE=1'b0;
    parameter OPEN=1'b1, CLOSED=1'b0;
    parameter UPFLAG=2'b01,DNFLAG=2'b10,STATIC=2'b00;


	FrequenceDevide fd(.CLK(CLK),.reset(reset),.clk(clk));//降频模块
    		
	LEDDisplay led(.pos(pos), .seg(seg));
  
    /*
	always @(posedge clk or posedge choice)
		if(choice)
			FrequenceDevide fd(.CLK(CLK),.reset(reset),.clk(clk));//降频模块
		else
			FrequenceDevide2 fd(.speedup(speedup),.CLK(CLK),.reset(reset),.clk(clk));//降频模块*/
    
    always @(posedge sw0 or posedge reset or posedge DoorFlag)//一层上升请求
        begin
        if(reset)
            Up1Dis<=1'b0;
        if(sw0)
			Up1Dis<=1'b1;
  		else if(DoorFlag)
			begin
				if(pos==4'b0001)
					begin
						Up1Dis<=1'b0;
					end
			end
        end

    always @(posedge sw1 or posedge reset or posedge DoorFlag)//二层上升请求
        begin
	    if(reset)
            Up2Dis<=1'b0;
        if(sw1)
			Up2Dis<=1'b1;
  		else if(DoorFlag)
			begin
				if(pos==4'b0010)
					begin
						Up2Dis<=1'b0;
					end
			end
        end
 
    always @(posedge sw2 or posedge reset or posedge DoorFlag)//三层上升请求
        begin
	    if(reset)
            Up3Dis<=1'b0;
        if(sw2)
			Up3Dis<=1'b1;
  		else if(DoorFlag)
			begin
				if(pos==4'b0100)
					begin
						Up3Dis<=1'b0;
					end
			end
        end
  
    always @(posedge sw3 or posedge reset or posedge DoorFlag)//二层下降请求
        begin
	    if(reset)
            Dn2Dis<=1'b0;
        if(sw3)
			Dn2Dis<=1'b1;
  		else if(DoorFlag)
			begin
				if(pos==4'b0010)
					begin
						Dn2Dis<=1'b0;
					end
			end
        end
  
    always @(posedge sw4 or posedge reset or posedge DoorFlag)//三层下降请求
        begin
	    if(reset)
            Dn3Dis<=1'b0;
        if(sw4)
			Dn3Dis<=1'b1;
  		else if(DoorFlag)
			begin
				if(pos==4'b0100)
					begin
						Dn3Dis<=1'b0;
					end
			end
        end

    always @(posedge sw5 or posedge reset or posedge DoorFlag)//四层下降请求
        begin
	    if(reset)
            Dn4Dis<=1'b0;
        if(sw5)
			Dn4Dis<=1'b1;
  		else if(DoorFlag)
			begin
				if(pos==4'b1000)
					begin
						Dn4Dis<=1'b0;
					end
			end
        end
	
    always @(posedge k0 or posedge reset or posedge DoorFlag)
       begin
	    if(reset)
			Stop1Dis<=1'b0;
        if(k0)
			Stop1Dis<=1'b1;				
		else if(DoorFlag)
			begin
				if(pos==4'b0001)
					begin
						Stop1Dis<=1'b0;
					end
			end
       end
	
	always @(posedge k1 or posedge reset or posedge DoorFlag)
       begin
	    if(reset)
			Stop2Dis<=1'b0;
        if(k1)
			Stop2Dis<=1'b1;				
		else if(DoorFlag)
			begin
				if(pos==4'b0010)
					begin
						Stop2Dis<=1'b0;
					end
			end
       end

	always @(posedge k2 or posedge reset or posedge DoorFlag)
       begin
	    if(reset)
			Stop3Dis<=1'b0;
        if(k2)
			Stop3Dis<=1'b1;				
		else if(DoorFlag)
			begin
				if(pos==4'b0100)
					begin
						Stop3Dis<=1'b0;
					end
			end
       end
       
	always @(posedge k3 or posedge reset or posedge DoorFlag)
       begin
	    if(reset)
			Stop4Dis<=1'b0;
        if(k3)
			Stop4Dis<=1'b1;				
		else if(DoorFlag)
			begin
				if(pos==4'b1000)
					begin
						Stop4Dis<=1'b0;
					end
			end
       end

	always @(pos or blink or reset or clk)
		begin
			if(reset)
				PosDis=4'b0001;
		    else if(blink)//开门LED闪烁
				PosDis=IDLE;
		    else
				case(pos)
					FLOOR1:
						PosDis=FLOOR1;
					FLOOR2:
						PosDis=FLOOR2;
					FLOOR3:
						PosDis=FLOOR3;
					FLOOR4:
						PosDis=FLOOR4;
					default:
						PosDis=FLOOR1;
				endcase
				
				//若使用如下方法，电梯不能正常运行
				//同时赋值时钟脉冲紊乱，故单独使用LEDDisplay模块处理楼层LED显示
				/*case(pos)
					FLOOR1:
					begin
						PosDis<=FLOOR1;
						seg<=7'b1111001;
					end
					FLOOR2:
					begin
						PosDis<=FLOOR2;
						seg<=7'b0100100;
					end
					FLOOR3:
					begin
						PosDis<=FLOOR3;
						seg<=7'b0110000;
					end
					FLOOR4:
					begin
						PosDis<=FLOOR4;
						seg<=7'b0011001;
					end
					default:
					begin
						PosDis<=FLOOR1;
						seg<=7'b1111001;
					end
					
				endcase	*/		
		end
    
    always @(Up1Dis or Up2Dis or Up3Dis )
        UpReq={1'b0,Up3Dis,Up2Dis,Up1Dis}; 
         
    always @(Dn2Dis or Dn3Dis or Dn4Dis)
        DownReq={Dn4Dis, Dn3Dis, Dn2Dis,1'b0};  
 
    always @(Stop1Dis or Stop2Dis or Stop3Dis or Stop4Dis)
         StopReq={Stop4Dis,Stop3Dis,Stop2Dis,Stop1Dis};


    always @(posedge clk or posedge reset)
        if(reset)
            begin
                LiftState<=WAIT;  
            end
        else
			begin    
				LiftState<=NextState;
			end

    always @(clk)
	begin
		if((DoorFlag==OPEN)&&(~clk))//门打开并且时钟信号处于低电平
			blink<=1'b1;//开门LED闪烁信号
		else
			blink<=1'b0;
	end
	
    always @(LiftState or UpReq or DownReq or StopReq or pos or count or UpDnFlag or reset)
    begin
        if(reset)
			NextState=WAIT;
		else
        case(LiftState)
            WAIT:
                begin
               	    if(StopReq>0)//有停靠请求否
                        begin
                            if((StopReq&pos)>0)//停靠请求中有当前楼层停靠请求否
                                NextState=OPENDOOR;//有当前楼层请求，则下一状态转开门
                            else if(StopReq>pos)//有当前楼层之上的停靠请求否   
                                NextState=UP;
                            else
                                NextState=DOWN;
                       	end
                    else if((UpReq&pos)||(DownReq&pos))//上下请求中有当前楼层请求否
                        begin
                            NextState=OPENDOOR;
                        end
                    else if((UpReq>pos)||(DownReq>pos))//上下请求中有当前楼层之上的请求否
                        NextState=UP;
                    else if(UpReq||DownReq)//上下请求中有当前楼层之下的请求否
                        NextState=DOWN;
                    else
                        NextState=WAIT;//无任何请求，继续处于WAIT模式
                                        
                end
            UP:
				begin
                	if((StopReq&pos)||(UpReq&pos))//停靠或上升请求中有当前楼层的请求否
                        NextState=UPSTOP;//有，下一状态转为UPSTOP(停靠后要1s才开门,UPSTOP即为这1s的过渡期)
                    else if((StopReq>pos)||(UpReq>pos))//停靠或上升请求中有当前楼层之上的请求否
                        NextState=UP;
                    else if(DownReq>0)//有下降请求否
                        begin
                            if((DownReq>pos)&&((DownReq^pos)>pos))//下降请求中有当前楼层之上的请求否
                                NextState=UP;
                            else if((DownReq&pos)&&(pos<FLOOR4)) 
                                NextState=DOWNSTOP;
                            else if((DownReq&pos)&&(pos==FLOOR4))
                                NextState=DOWNSTOP;
                            else//下降请求中只有当前楼层之下的请求
                                NextState=DOWN;
                          end
                    else if(StopReq||UpReq)//只有当前楼层之上的停靠或上升请求否
                        NextState=DOWN;
                    else
                        NextState=WAIT;//无任何请求，转为WAIT模式
                end

            DOWN:
                begin
             		if((StopReq&pos)||(DownReq&pos))
                        NextState=DOWNSTOP;
                    else if(((StopReq&FLOOR1)<pos&&(StopReq&FLOOR1))||((StopReq&FLOOR2)<pos&&(StopReq&FLOOR2))||((StopReq&FLOOR3)<pos&&(StopReq&FLOOR3))||((StopReq&FLOOR4)<pos&&(StopReq&FLOOR4)))
                        NextState=DOWN;
                   else if(((DownReq&FLOOR1)<pos&&(DownReq&FLOOR1))||((DownReq&FLOOR2)<pos&&(DownReq&FLOOR2))||((DownReq&FLOOR3)<pos&&(DownReq&FLOOR3))||((DownReq&FLOOR4)<pos&&(DownReq&FLOOR4)))
                           NextState=DOWN;
   
                    else if(UpReq>0)
                        begin
                            if(((UpReq&FLOOR1)<pos&&(UpReq&FLOOR1))||((UpReq&FLOOR2)<pos&&(UpReq&FLOOR2))||((UpReq&FLOOR3)<pos&&(UpReq&FLOOR3))||((UpReq&FLOOR4)<pos&&(UpReq&FLOOR4)))
                                NextState=DOWN;
                            else if((UpReq&pos)&&(pos>FLOOR1)) 
                                NextState=UPSTOP;
                            else if((UpReq&pos)&&(pos==FLOOR1))
                                NextState=UPSTOP;
                            else
                                NextState=UP;
                          end
                      else if(StopReq||DownReq)
                          NextState=UP;
                      else
                        NextState=WAIT;
                end

            UPSTOP:
                begin
					NextState=OPENDOOR;
                end
            DOWNSTOP:
                begin
					NextState=OPENDOOR;
                end
            OPENDOOR:
                begin
                    if(count<4)//开门不足4周期，则继续转移到开门状态
                        NextState=OPENDOOR;
                    else
                        NextState=CLOSEDOOR;
                end
            CLOSEDOOR:
                begin
                    if(UpDnFlag==UPFLAG)//开门关门前电梯是处于上升状态
                        begin
                            if((StopReq&pos)||(UpReq&pos))//上升或停靠请求中有当前楼层的请求否，有可能关门的瞬间又有新的请求
                                NextState=OPENDOOR;
                            else if((StopReq>pos)||(UpReq>pos))//上升或停靠请求中有当前楼层之上的请求否
                                NextState=UP;
                            else if(DownReq>0)//有下降请求否
                                begin
                                    if((DownReq>pos)&&((DownReq^pos)>pos))//有当前楼层之上的下降请求，则下一状态转移上升
                                        NextState=UP;
                                    else if((DownReq&pos)>0)//有当前楼层的下降请求信号，且更上层无下降请求
                                        NextState=OPENDOOR;
                                    else//只有低于当前层的下降请求
                                        NextState=DOWN;
                                end
                            else if(StopReq||UpReq)//上升和停靠请求中只有当前层下的请求
                                NextState=DOWN;
                            else
                                NextState=WAIT;//无任何请求，转为WAIT模式
                        end				
                    else if(UpDnFlag==DNFLAG)
                        begin
                            if((StopReq&pos)||(DownReq&pos))
                                NextState=OPENDOOR;
                            else if(((StopReq&FLOOR1)<pos&&(StopReq&FLOOR1))||((StopReq&FLOOR2)<pos&&(StopReq&FLOOR2))||((StopReq&FLOOR3)<pos&&(StopReq&FLOOR3))||((StopReq&FLOOR4)<pos&&(StopReq&FLOOR4)))
                                NextState=DOWN;
                            else if(((DownReq&FLOOR1)<pos&&(DownReq&FLOOR1))||((DownReq&FLOOR2)<pos&&(DownReq&FLOOR2))||((DownReq&FLOOR3)<pos&&(DownReq&FLOOR3))||((DownReq&FLOOR4)<pos&&(DownReq&FLOOR4)))
                                NextState=DOWN;
                            else if(UpReq>0)
                                begin
                                    if(((UpReq&FLOOR1)<pos&&(UpReq&FLOOR1))||((UpReq&FLOOR2)<pos&&(UpReq&FLOOR2))||((UpReq&FLOOR3)<pos&&(UpReq&FLOOR3))||((UpReq&FLOOR4)<pos&&(UpReq&FLOOR4)))
                                        NextState=DOWN;
                                    else if((UpReq&pos)>0)
                                        NextState=OPENDOOR;
                                    else
                                        NextState=UP;
                                end
                            else if(StopReq||DownReq)
                                   NextState=UP;
                            else
                                NextState=WAIT;
                        end
                    else
                        begin
                            if(StopReq>0)
                                begin
                                    if((StopReq&pos)>0)
                                        NextState=OPENDOOR;
                                    else if(StopReq>pos)
                                        NextState=UP;
                                    else 
                                        NextState=DOWN;
                                 end
                            else if((UpReq&pos)||(DownReq&pos))
                                begin
                                    NextState=OPENDOOR;
                                end
                            else if((UpReq>pos)||(DownReq>pos))
                                NextState=UP;
                            else if(UpReq||DownReq)
                                NextState=DOWN;                           
                            else
                                begin
                                    NextState=WAIT;
                                end              
                        end
                    end
                default:
                    NextState=WAIT;
               endcase
           end
               

    always @(posedge clk or posedge reset)
        if(reset)
            begin
                pos<=FLOOR1;
                DoorFlag<=CLOSED;
                UpDnFlag<=STATIC;
            end
        else        
			begin
					case(NextState)
						WAIT:
							begin
								pos<=pos;
								DoorFlag<=CLOSED;
								UpDnFlag<=STATIC;
							end
						UP:
							begin
								pos<=pos<<1;
								DoorFlag<=CLOSED;
								UpDnFlag<=UPFLAG;
							end
						DOWN:
							begin
								pos<=pos>>1;
								DoorFlag<=CLOSED;
								UpDnFlag<=DNFLAG;
							end
						UPSTOP:
							begin
								pos<=pos;
								DoorFlag<=CLOSED;
								UpDnFlag<=UPFLAG;
							end
						DOWNSTOP:
							begin
								pos<=pos;
								DoorFlag<=CLOSED;
								UpDnFlag<=DNFLAG;
							end
						OPENDOOR:
							begin
								pos<=pos;
								DoorFlag<=OPEN;
								UpDnFlag<=UpDnFlag;
							end
						CLOSEDOOR:
							begin
								pos<=pos;
								DoorFlag<=CLOSED;
								UpDnFlag<=UpDnFlag;
							end
						default:
							begin
								pos<=FLOOR1;
								DoorFlag<=CLOSED;
								UpDnFlag<=STATIC;
							end
							
					endcase
			end


    always @(posedge clk or posedge reset)
        if(reset)
            count<=0;
        else if((NextState==OPENDOOR)&&(count<4))
            count<=count+1;
        else
            count<=0;
endmodule