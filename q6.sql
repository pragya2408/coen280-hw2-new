select MAX(f.FVotes), MAX(C.CVotes), MAX(U.UVotes)
FROM Votefunny F, VoteCool C, VoteUseful U, YelpBusiness B
WHERE B.State='CA'