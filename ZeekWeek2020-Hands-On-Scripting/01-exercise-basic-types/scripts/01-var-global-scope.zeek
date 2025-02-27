module training;

export { 
    global ip = 1.1.1.1; 
    global net = 1.1.1.0/24 ; 
    global answer: bool = F; 
} 

event zeek_init()
    {
        if (ip in net) { 
            answer= T; 
        } 
    } 

module training2; 

event zeek_done()
    {
	print fmt("Answer that %s is in %s: %s", training::ip, training::net, training::answer); 

    # try with global out of export and module training2 commented out. 
	# print fmt("Answer that %s is in %s: %s", ip, net, answer); 



	print fmt (""); 
	print fmt (""); 
	print fmt ("Notes: Since ip, net and answer are decleared as global variables"); 
	print fmt ("*AND* inside export block, their scope remains across zeek scripts"); 
	print fmt ("if used with module: eg. training::ip"); 
	print fmt ("Were these not exported, then their global scope ends as soon as next"); 
	print fmt ("module is encountered. Try removing all the tree global variables out of"); 
	print fmt ("export {} and see how it works ? Also, try after commenting out module training2"); 
    } 


