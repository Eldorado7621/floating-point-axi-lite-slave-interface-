function [force]=gravityRef(m1,m2,dist)
  
  %prevent division by error
  zeroIdx=find(dist==0)
  if zeroIdx
    dist(zeroIdx)=0.001;
  end
  force=10*((m1*m2)./dist.^2);
  end