(h,s,l)=>{h*=6;s*=l<.5?l:1-l;H=++h|0;r[2]=0;r[H/2%3|0]=s*2;r[2-H%3]=Math.abs(h%2-1);return r.map(x=>((x+=l-s)<1?x:1)*255|0)}
