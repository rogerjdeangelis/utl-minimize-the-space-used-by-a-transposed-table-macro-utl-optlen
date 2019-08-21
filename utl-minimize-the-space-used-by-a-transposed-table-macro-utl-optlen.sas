Minimize the space used by a transposed table                                                                              
                                                                                                                           
I had to over specify lengths of my input variables and transpose exagerates the problem.                                  
I would like to minimize the space of the transposed dataset.                                                              
                                                                                                                           
github                                                                                                                     
https://tinyurl.com/y5sa3vss                                                                                               
https://github.com/rogerjdeangelis/utl-minimize-the-space-used-by-a-transposed-table-macro-utl-optlen                      
                                                                                                                           
https://tinyurl.com/y2xkw8at                                                                                               
https://communities.sas.com/t5/New-SAS-User/Economize-disk-space-when-using-proc-transpose-or-alternatives/m-p/582332      
                                                                                                                           
macros                                                                                                                     
https://tinyurl.com/y9nfugth                                                                                               
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                 
                                                                                                                           
*_                   _                                                                                                     
(_)_ __  _ __  _   _| |_                                                                                                   
| | '_ \| '_ \| | | | __|                                                                                                  
| | | | | |_) | |_| | |_                                                                                                   
|_|_| |_| .__/ \__,_|\__|                                                                                                  
        |_|                                                                                                                
;                                                                                                                          
                                                                                                                           
data hav;                                                                                                                  
input ID Varname :$64. value & :$96.;                                                                                      
CARDS4;                                                                                                                    
5642121 age 50                                                                                                             
5642121 city New york                                                                                                      
5642121 firstname john                                                                                                     
5642121 lastname smith                                                                                                     
5642125 age 40                                                                                                             
5642125 city New jersey                                                                                                    
5642125 firstname Paul                                                                                                     
5642125 lastname lennon                                                                                                    
5642125 children yes                                                                                                       
5642125 car ferrari                                                                                                        
;;;;                                                                                                                       
run;quit;                                                                                                                  
                                                                                                                           
proc transpose data=hav out=have (drop=_name_ compress=yes);                                                               
by id;                                                                                                                     
var value;                                                                                                                 
id varname;                                                                                                                
run;                                                                                                                       
                                                                                                                           
WORK.HAVE total obs=2                                                                                                      
                                                                                                                           
    ID      age       city       firstname    lastname    children      car                                                
                                                                                                                           
 5642121    50     New york        john        smith                                                                       
 5642125    40     New jersey      Paul        lennon       yes       ferrari                                              
                                                                                                                           
Variables in Creation Order                                                                                                
                                                                                                                           
#    Variable     Type    Len                                                                                              
                                                                                                                           
1    ID           Num       8                                                                                              
2    age          Char     96   * uses the longest length because                                                          
3    city         Char     96     all data has to fit in the column                                                        
4    firstname    Char     96                                                                                              
5    lastname     Char     96                                                                                              
6    children     Char     96                                                                                              
7    car          Char     96                                                                                              
                                                                                                                           
                                                                                                                           
*            _               _                                                                                             
  ___  _   _| |_ _ __  _   _| |_                                                                                           
 / _ \| | | | __| '_ \| | | | __|                                                                                          
| (_) | |_| | |_| |_) | |_| | |_                                                                                           
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                          
                |_|                                                                                                        
;                                                                                                                          
                                                                                                                           
WORK.HAVE total obs=2                                                                                                      
                                                                                                                           
    ID      age       city       firstname    lastname    children      car                                                
                                                                                                                           
 5642121    50     New york        john        smith                                                                       
 5642125    40     New jersey      Paul        lennon       yes       ferrari                                              
                                                                                                                           
                                                                                                                           
                                                                                                                           
  Variables in Creation Order                                                                                              
                                                                                                                           
 #    Variable     Type    Len                                                                                             
                                                                                                                           
 1    ID           Num       5                                                                                             
 2    age          Char      2                                                                                             
 3    city         Char     10                                                                                             
 4    firstname    Char      4                                                                                             
 5    lastname     Char      6                                                                                             
 6    children     Char      3                                                                                             
 7    car          Char      7                                                                                             
                                                                                                                           
*          _       _   _                                                                                                   
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                        
/ __|/ _ \| | | | | __| |/ _ \| '_ \                                                                                       
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                      
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                      
                                                                                                                           
;                                                                                                                          
                                                                                                                           
%utl_optlen(inp=have,out=want);                                                                                            
                                                                                                                           
                                                                                                                           
                                                                                                                           
