function overall_grade  =  couresegrade(e1, e2, e3, fe)

fe = fe/2
minval = 150;
score_list = [e1, e2, e3];
for i = score_list
    if i < minval
        minval = i
    end
end
loc1 = find(score_list==minval);
if minval>=25 && minval<fe
    minval = fe
elseif minval>=25 && minval>fe
    minval = minval
end

score_list(loc1) = minval;
overall_grade = sum(score_list);
end


