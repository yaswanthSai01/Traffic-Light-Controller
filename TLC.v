module TLC(
  input sensor,
  input clock,
  input reset,
  output reg[1:0] main_road, //Main Raod Light
  output reg[1:0] side_road, //Side Rad Light
);
  reg[3:0] count;
  reg[3:0] ps, next_ps;
  
  //State Encoding
  localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
  
  //Timing parameters
  parameter TL = 10; //Time for Main road GREEN Light
  parameter TS = 6; //Time for Side road GREEN Light
  parameter TY = 4; //Time for YELLOW Light
  
  //State Transition Logic
  
  always@(posedge clock or posedge reset)
    begin
        if(reset)
            begin
                ps <= s0;
                count <= 0;
            end
         else 
            begin
                ps <= next_ps;
                if(ps != next_ps) 
                    count<=0;
                else
                    count++;
            end
    end

    //Next State Logic

    always@(*)
        begin
            case(ps)

            s0: //Green on Main road & Red on Side Road
                if(~sensor || count<TL )
                    begin
                        next_ps <= s0;
                    end
                else if(sensor&&count ==TL)
                    begin
                        next_ps <= s1;
                    end

            s1: //Yellow on Main Road & Red on Side Road   
                if(count<TY)
                    begin
                        next_ps <= s1;
                    end
                else
                    begin
                        next_ps <= s2;
                    end

            s2: //Green on Side Road & Red on Main Road
                if(count<TS)
                    begin
                        next_ps <= s2;
                    end
                else
                    begin
                        next_ps <= s3;
                    end
            
            s3: //Yellow on Side Road & Red on Main Road
                if(count<TY)
                    begin
                        next_ps <= s3;
                    end
                else
                    begin
                        next_ps <= s0;
                    end

            default:
                        next_ps <= s0;

            endcase
        end

        //Output Logic
        always@(*)
            begin
                case(ps)

                s0:
                    begin
                        main_road = 2'b01; //Green on Main Road
                        side_road = 2'b10; //Red on Side Road
                    end
                s1:
                    begin
                        main_road = 2'b10; //Yellow on Main Road
                        side_road = 2'b10; //Red on Side Road
                    end
                s2:
                    begin
                        main_road = 2'b00; //Red on Main Road
                        side_road = 2'b01; //Green on Side Road
                    end
                s3:
                    begin
                        main_road = 2'b00; // Red on Main Road
                        side_road = 2'b00; // Yellow on Side Road
                    end

                default:
                     begin
                        main_road = 2'b01; //Green on Main Road
                        side_road = 2'b10; //Red on Side Road
                    end


                endcase
            end

endmodule
                        



