# One of multiple awk files to help arrange the names to make sorting easy
# (and then change it to the final result)    
{     for(i=NF;i>0;i--){
        printf( "%s ", $i);
        }
        printf("\n");
}

