clear
clc

pop_size =100 ;
n = 10;
m = 3;
k = 4;
Pc = 0.8;
Pm = 0.2;
G = 1000;

Initial_Group = pop(pop_size,n,k,m);
[Initial_Group,fitness_time] = decode( Initial_Group,pop_size,n,k,m );

father = father_pair(pop_size);
[children] = cross(pop_size,father, Initial_Group, Pc, n, k);
% [children1] = mutation(pop_size,Pm,children, n, k);      
% [species,min0,everage0] = next_pop(pop_size,Initial_Group,children1,n,k,m);
% 交叉变异一起
[species,min0,everage0] = next_pop(pop_size,Initial_Group,children,n,k,m);
 min = zeros(G,1);
%  everage =zeros(G,1);
for i = 1:G
    i
    if i>400
        Pc = 0.3;
    end
     father = father_pair(pop_size);
    [children] = cross(pop_size,father, species, Pc, n, k);
%     [children1] = mutation(pop_size,Pm,children, n, k);   
%     [species,min0,everage0] = next_pop(pop_size,species,children1,n,k,m );
    [species,min0,everage0] = next_pop(pop_size,species,children,n,k,m);
    min(i,1) = min0;
end


plot(min(:,1))   
% plot(everage(:,1))
    
    

