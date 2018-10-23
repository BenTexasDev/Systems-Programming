# awk file for part B
BEGIN{ 
    printf("%-12s %-10s %10s %-10s\n", "Name","Flight","Seats","Total Cost");
    total = 0;          #Above prints the header for the files/columns
    cost;
}
{ 
   if($1 == "CUST"){
       name=$6;         #Set the 6th field of the line to name
   }
   else if($1 == "RESERVE"){
       if($2 in arr){   #Second field equals total of the 3rd field.
        arr[$2]+=$3;    #Only printing total num of seats
       }
           else{
            arr[$2]=$3;
       }
     cost = $3 * $4;    #Number of seats times the price for cost
     printf("%-12s %-10s %10d %10.2f\n", name , $2, $3, cost);
     total = total + cost;
    }
    else if($1 == "ENDCUST"){ 
        printf("\t\t\t%10s %10.2f\n","Total",total);
        total = 0;      #Set total back to 0, for "each" customer
}
    
}
END{printf("%-10s %12s\n","Flight","Total Seats");
for (key in arr)        #Print the flights with total seats
    printf("%-10s %9d\n",key,arr[key]);
}
