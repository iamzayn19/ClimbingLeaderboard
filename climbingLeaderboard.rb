def climbingLeaderboard(ranked,player)
    #retaining only the unique members from the ranked array
    ranked.uniq!
    #reversing the ranked array for iterations
    ranked=ranked.reverse
    #declaring an empty rank array for results
    rank = []
    puts "Player: #{player}"
    puts "Ranked(reversed): #{ranked}"
    #iterating over each index of player array
    player.each do |ply|
      #comparing the value of player's value with all of ranked values
      #the indexes stored in results array are subtracted from the length because we reversed the array in the   
      #start
      ranked.each do |r|
      #storing the index as ranked index-1 if both values are matched because if it's 3 for a 5 sized ranked   
      #array, that means its accurate index is actually 2 because it's actual rank is 2 on a (1-5) scale as 
      #indexes start from 0 and we have reversed the array
      #also just to ensure we are not at the end of array in ranked the last condition is applied
      #because the last line in this "each block" will handle that case
      rank.push(ranked.index(r)-1) if ply==r && r!=ranked[-1]
      #storing the index as (ranked.length-ranked.index(r))+1 
      #if player's score is less than the ranked one because if it's index is 1, then it's actual index
      #is 5-1 = 4+1 = 5 if the size of ranked is 5
      rank.push((ranked.length-ranked.index(r))+1) if ply<r
      #if we have reached the end of ranked that means we have the largest value (as we reversed the array)
      #we can compare and see if the player's value is greater than or equal to the highest score on ranked
      rank.push(ranked.length-ranked.index(r)) if r == ranked[-1] && ply>=r
      #this breaks the loop if player's value is less than or equal to rank
         break if ply<=r
       end    
    end 
    #the results in the rank array are displayed
    puts "Result: #{rank}"
    #rank array is also returned
    rank 
  end 
  
  #declaring a ranked array
  ranked=[110,90,90,80,75,60]
  #declaring a player array
  player=[50,65,102,77,90]
  #calling the function climbingLeaderboard with ranked and #player parameters
  climbingLeaderboard(ranked,player)
  
  