do for [k=0:ASIZE-1] {
	cpx=px_get(k)
	cpy=py_get(k)
	cqx=qx_get(k)
	cqy=qy_get(k)
	dummy=px_set(k,cpx-dt*0.5*partial_qx(cqx,cqy))
	dummy=py_set(k,cpy-dt*0.5*partial_qy(cqx,cqy))
}
do for [k=0:ASIZE-1] {
	cpx=px_get(k)
	cpy=py_get(k)
	cqx=qx_get(k)
	cqy=qy_get(k)
	dummy=qx_set(k,cqx+dt*partial_p(cpx))
	dummy=qy_set(k,cqy+dt*partial_p(cpy))
}
do for [k=0:ASIZE-1] {
	cpx=px_get(k)
	cpy=py_get(k)
	cqx=qx_get(k)
	cqy=qy_get(k)
	dummy=px_set(k,cpx-dt*0.5*partial_qx(cqx,cqy))
	dummy=py_set(k,cpy-dt*0.5*partial_qy(cqx,cqy))
}

do for [k=0:ASIZE-1] {print qx_get(k),qy_get(k)}
m=m+1
if(m<m_max) reread
m=0

outfile(n) = sprintf("f%d.jpg",n+10000) #出力ファイル名
title(n) = sprintf("t = %4.2f",n*dt) #タイトル名
unset label
set label title(n) font 'Times,12' at -wx/2, wy/2
set output outfile(n)
plot DATA with points pt 1 ps 0.1

n = n+1
if(n < n_max) reread
n=0