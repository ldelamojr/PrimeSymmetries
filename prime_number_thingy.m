%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%NEXT UP IS TO TRY AND MAKE THE PROGRAM MORE EFFICIENT%%  AND FIX GRID
%%ALSO WANT TO KNOW THE LARGEST LENGTH SYMMETRIC STRINGS AMONG ALL STARTING
%%POSITIONS
clear
clc

MinStart = 200
MaxStart = 300
grid ON
LengthOfSymSeq = 100
hold all
SymmetryFinder = ones(MaxStart,MaxStart)
for start = MinStart:MaxStart
    start
    m=1;
    for n = start:start + LengthOfSymSeq%Formerly n=start:LengthOfSymSeq
        %SymVal = zeros(1,END-start+1);
        int = [start:1:n]  %I think this can begin at "start."
        comp = zeros(1,n-start+1)  %This too.
        for i = 1:n-start+1
            if 1 - isprime(int(i))
                comp(i) = int(i)
            end
        end
        j = 1
        i = 1
        diffseq(1) = 0
        while i  <  size(comp,2) - 2      
            if comp(i+1)-comp(i) > 0
                diffseq(j) = comp(i+1) - comp(i)
                i = i+1
            elseif comp(i+2) - comp(i) > 0
                diffseq(j) = comp(i+2) - comp(i)
                i = i+2
            else comp(i+3) - comp(i) > 0
                diffseq(j) = comp(i+3) - comp(i)
                i = i+3
            end
            j = j+1
        end
        s = size(diffseq)
        checkdiffseq = zeros(1,ceil(s(2)/2))        
        for i = 1:(s(2)/2) 
            checkdiffseq(i) = diffseq(i) - diffseq(s(2) - i + 1)
        end 
        
        SymVal(m) = sum(abs(checkdiffseq))    
        if SymVal(m) == 0
            SymmetryFinder(start,n) = n
            hold all
            subplot(2,1,1)
            plot3(start,n,0,'o')
            LengthOfSymmetricString(start,n) = n-start
        end
        m=m+1
    end
    
    hold all
    subplot(2,1,1)
    grid
    plot3((ones(1,n-start+1)*start),[start:1:n],SymVal)
    %if SymVal == 0
        %plot3((ones(1,n-start+1)*start),[start:1:n],
    
    hold all
    subplot(2,1,2)
    grid
    plot((ones(1,size(SymmetryFinder,2))*start),SymmetryFinder,'o')    
    clear SymVal diffseq SymmetryFinder

end