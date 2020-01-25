function values = getValues(y,t,t_i)
  L=length(t_i)
  values = zeros(L,1)
  for ii = 1:L
    idx=find(t>=t_i(ii),1)
    t(idx)
    values(ii)=y(idx)
    values
  end