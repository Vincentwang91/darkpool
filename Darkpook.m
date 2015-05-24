%Dark Pool Simulation V1.0
%05/23/15

%--Definition
%--Participant Table
%-------------|--1---|-------2------|--3-|---4-----|---5----|-6--|--7-|--8-|--9-|-----10----|--------11----------|
%Parcipitants=(Number, Quantity Left, Bid, Bid Time, Bid #-1, #-2, #-3, #-4, #-5, Urgency(R), Bidder(1)/Seller(0))
p_max=60;
P=zeros(p_max, 11);

%--Transaction Table
%------------|-----1-------|------2-------|---3--|----4----|--5--|----6----|----7----|
%Transaction=(Bidder Number, Seller Number, Price, Quantity, Time, Bidder R, Seller R) 
Tr=zeros(1, 7);

%--Initiation

P(:,1)=    [1:p_max]';%#
P(:,2)=    repmat(100,p_max,1);%Qty
P(:,3)=    [104+2*rand(p_max/2,1);94+2*rand(p_max/2,1)];%Initial Bid
P(:,4)=    1;%Initial Bid
P(:,10)=   100 * rand(p_max,1)+ 1;%R
P(1:p_max/2,11)=    repmat(1,p_max/2,1);%Bidders 

% # of digits
P(:,3)=round(P(:,3),2);
P(:,10)=round(P(:,10),0);

for t=1:1000
    %Price Increase/Decrease
    P(P(:,4)==t,[5 6 7 8 9])= P( (P(:,4)==t) , [3 5 6 7 8]);
    
    P( (P(:,4)==t) & (P(:,11)==1) ,3)= P((P(:,4)==t)&(P(:,11)==1),5) - round(0.5*rand(),2);
    P( (P(:,4)==t) & (P(:,11)==0) ,3)= P((P(:,4)==t)&(P(:,11)==0),5) + round(0.5*rand(),2);
    
    %Recording to Transaction Table
    
    
    
    
    
    %Next Bid Time
    P(P(:,4)==t,4)= P(P(:,4)==t,4) + P(P(:,4)==t,10); 
    
    
    
    
end

