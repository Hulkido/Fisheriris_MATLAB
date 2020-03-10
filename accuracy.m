function accu=accuracy(actual_y,finded_y)
accu=sum(strcmp(actual_y,finded_y))*(100/size(actual_y,1)); % finding percentage of values which are equal to each other in actual_y and finded_y i.e accuracy of our system
