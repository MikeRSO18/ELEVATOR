library ieee;
use ieee.std_logic_1164.all;

Entity MSS is

PORT(borrar,ABRIR_PUERTA,clock,switch: IN std_logiC;
pis_a,seg25,seg5,seg3: IN std_logiC;
pedid_i_s,pedid_i_b: IN std_logiC;
subiendo,bajando, clock_1: IN std_logiC;
cnt_disp,ramMod:OUT std_logic;
encnup,LdCn_UP,resetCn_UP:OUT std_logic;
encndwn,LdCn_DWN,resetCn_DWN:OUT std_logic;
en3s,en5s:OUT std_logic;
resetANT,LoadANT,Conts_b:OUT std_logic;
Alarma_sonora,LED_ROJO,LED_AZUL,reset3s,reset5s,reset25s:OUT std_logic;
resetMemoria,mode_f,en25s, en_1clock, reset_1clock:OUT std_logic;
ya,yb,yc,yd,ye,yf,yh,yi,yj,yk,slect_bloq:OUT std_logic);
end MSS;

Architecture sol of MSS is
type estado is (a,b,c,d,e,f,h,i,j,k,l,m,n,g);
signal y: estado;
Begin
process(borrar,clock)
  begin
  if borrar='0' then y<=a;

  elsif clock'event and clock='1' then
    case y is 
	   when a=>
		  if switch='0' then y<=a;
		  else y<=b;end if;
		  
		when b=>
		    y<=l;
			 
		when c=>
		  if (pedid_i_s='0' and pedid_i_b='1') then y<=k;
		  elsif (pedid_i_s='1' and subiendo='1') then y<=j;
		  elsif (pedid_i_s='1' and subiendo='0'and pedid_i_b='1') then y<=k;
		  elsif (pedid_i_s='1' and pedid_i_b='0') then y<=j;
		  else y<=c;
		  end if;
		
		

		when j=>
			if (seg3='1') then y<=m; 
			else y<=j; end if;
		
		when d=>
		 if ( pis_a='1') then y<=f; 
			else y<=c;end if;
			
		when l=>
		y<=c;
		
		when m=>
		y<=d;
		  
		  
		when k=>
			if ( seg3='1') then y<=n; 
			else y<=k; end if;

		when n=>
		y<=e;
			
		when e=>
		  if (pis_a='1') then y<=f; 
			else y<=c; end if;
		
		when f=>
		  if (seg5='1') then y<=g;
		  		  else y<=f;end if;
		  
		when g=>
		  
		  if ( ABRIR_PUERTA='1' and seg25='1') then y<=i;
		  elsif(ABRIR_PUERTA='0')then y<=h;
		  else y<=g;end if;
		 
	
		 
		when h=>
		  if (seg3='0') then y<=h;
		  else y<=c;end if;
		  
		when i=>
		  y<=i;
	 
	 end case;
	 end if;
end process;

process (y,ABRIR_PUERTA,switch,pis_a,seg25,seg5,seg3,pedid_i_s,pedid_i_b)

begin
cnt_disp<='0';ramMod<='0'; encnup<='0';LdCn_UP<='1';resetCn_UP<='1'; reset3s<='1';reset5s<='1';en3s<='0';en5s<='0';resetANT<='1';LoadANT<='1';
Conts_b<='0';Alarma_sonora<='0';LED_ROJO<='0';LED_AZUL<='0'; encndwn<='0'; resetCn_DWN<='1';LdCn_DWN<='1'; reset_1clock<='1';
resetMemoria<='1';mode_f<='0';en25s<='0';reset25s<='1';ya<='0';yb<='0';yc<='0';yd<='0';ye<='0';yf<='0';yh<='0';yi<='0'; yj<='0';yk<='0';slect_bloq<='0';

case y is
	when a=> ya<='1'; slect_bloq<='1';Alarma_sonora<='1';
	when b=> yb<='1'; resetCn_UP<='0';resetCn_DWN<='0';resetANT<='0';resetMemoria<='0';
	when c=> yc<='1'; reset3s<='0';
			
	when d=> yd<='1'; reset3s<='0';if(pis_a='1') then reset5s<='0'; reset25s<='0'; end if;
	when e=> ye<='1'; reset3s<='0';if(pis_a='1') then reset5s<='0'; reset25s<='0'; end if; 
	when f=> yf<='1'; en5s<='1';Alarma_sonora<='1';LED_AZUL<='1';en_1clock<='1';  reset25s<='0';
	
	when h=> yh<='1'; Alarma_sonora<='1'; en3s<='1'; 
	when i=> yi<='1'; LED_ROJO<='1';
	
	when j=> yj<='1'; en3s<='1'; reset_1clock<='0'; if (seg3='1') then encnup<='1'; end if;
	when k=> yk<='1'; en3s<='1'; reset_1clock<='0';	if (seg3='1') then encndwn<='1'; Conts_b<='1'; end if;
	
	when l=>
	when m=>
	when n=>
	when g=> Alarma_sonora<='1';LED_AZUL<='1'; en25s<='1';
	         if(ABRIR_PUERTA='0') then reset3s<='0'; end if;
	

end case;
end process;					
				
end sol;