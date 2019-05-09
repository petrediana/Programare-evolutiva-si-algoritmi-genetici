>> G=graph([1 1], [2 3]);
>> G = addedge(G,2,3)
>> G=addedge(G,2,4)
>> G=addedge(G,2,5)
>> G=addedge(G,3,4)
>> G=addedge(G,4,6)
>> G=addedge(G,4,7)
>> G=addedge(G,5,3)
>> G=addedge(G,5,4)
>> G=addedge(G,5,6)
>> G=addedge(G,5,7)
>> plot(G)
>> G = [0 3 9 0 0 0 0; 
0 0 0 7 1 0 0; 
0 2 0 7 0 0 0; 
0 0 0 0 0 2 8; 
0 0 4 5 0 9 0; 
0 0 0 0 0 0 4; 
0 0 0 0 0 0 0; 
]; 
>> [cost ruta] = dijkstra(G,1,7)