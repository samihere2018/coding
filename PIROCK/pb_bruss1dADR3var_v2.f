c--------------------------------------------------------
c    2D Brusselator problem with stiff reaction
c--------------------------------------------------------
c    This driver shows how to use PIROCK. It solves a
c    system of ODEs resulting from the 2-dimensional space 
c    discretization of the Brusselator equations (u=u(x,y,t),v=v(x,y,t)):
c     
c    u_t=1.3+u^2*v-(1.+2.e7)*u+0.1*(u_{xx}+u_{yy})
c    v_t=2.e7*u-u^2*v+0.1*(v_{xx}+v_{yy})     for t>=0, 0<= x <= 1, 0<= y <= 1
c
c    with initial conditions 
c
c    u(x,y,0)=22*y*(1-y)^{3/2}  v(x,y,0)=27*x*(1-x)^{3/2}
c
c    and periodic boundary conditions
c
c    u(x+1,y,t)=u(x,y,t),  v(x,y+1,t)=v(x,y,t).
c
c    We discretize the space variables with
c    x_i=i/(N+1), y_i=i/(N+1) for i=0,1,...,N,
c    with N=200. We obtain a system of 80000
c    equations. 
c
c--------------------------------------------------------

      SUBROUTINE init(nsd,t,tend,y)
			implicit double precision (a-h,o-z)
      double precision  y(*)
      real*8 :: pi 
      parameter(pi = 3.141592653589793d0)
			
c --- common parameters for the problem -----
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth

c ----- dimensions -----
	neqn=nsd*npdes
	ns=nsd
      nssq=(ns-1)*(ns-1)
      nsnsm1=ns*(ns-1)
      alf=1.d-1
	amult=1.d0
	uxadv=-1.d-2  *amult
	uyadv=0.0d0  *amult
	vxadv=-1.d-2  *amult
	vyadv=0.0d0  *amult
      wxadv=-1.d-2  *amult
	wyadv=0.0d0  *amult
c    alph=alf
	brussa=6.d-1
	brussb=2.d0
      eps=1.d-2

      write(6,*) 'Integration of the '
     &   ,'1-dim Brusselator problem, ns=',ns
c ----- initial and end point of integration -----
      t=0.0d0
      tend=3.d0
c ----- initial values -----
      ans=ns
c      do j=1,ns
c        yy=(j-1)/ans
        do i=1,ns
          xx       = (i-1)/(ns-1)
          y(i*3-2) = brussa          + (1.d-1)*SIN(pi*xx)
          y(i*3-1) = (brussb/brussa) + (1.d-1)*SIN(pi*xx)
          y(i*3)   = brussb          + (1.d-1)*SIN(pi*xx)
        end do
c      end do
c      do i=1,ns
c        xx=(i-1)/ans
c        do j=1,ns
c           y(((j-1)*ns+i)*2)=27.d0*xx*(1.d0-xx)**(1.5d0)
c        end do
c      end do
			
      return
      end
			
      SUBROUTINE solout(neqn,t,tend,y,ytmp)
			implicit double precision (a-h,o-z)
      double precision  y(neqn),ytmp(neqn)
			
c --- common parameters for the problem -----
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth

c ----- file for solution -----
       open(8,file='sol.dat')
       rewind 8
		  write (8,*) t,(y((i)*3-2),i=1,ns),
     &     (y((i)*3-1),i=1,ns), (y((i)*3),i=1,ns)

			 write(6,*) 'Solution is tabulated in file sol.dat'
                   close(8)
      return
      end
c--------------------------------------------------------
c     The subroutine RHO gives an estimation of the spectral 
c     radius of the Jacobian matrix of the diffusion. This
c     is a bound for the whole interval and thus RHO is called
c     once.
c--------------------------------------------------------
      double precision function rhodiff(neqn,t,y)
      implicit double precision (a-h,o-z)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth
        rhodiff = 4.0d0*(nssq)*alf 
      return
      end 
c--------------------------------------------------------
c     The subroutine RHOADV gives an estimation of the spectral 
c     radius of the Jacobian matrix of the advection. This
c     is a bound for the whole interval and thus RHO is called
c     once.
c--------------------------------------------------------
      double precision function rhoadv(neqn,t,y)
      implicit double precision (a-h,o-z)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth
        rhoadv = (abs(uxadv)+abs(vxadv)+abs(wxadv))*(ns-1) 
      return
      end 
c--------------------------------------------------------
c     The subroutine FBRUS compute the value of f(x,y) and
c     has to be declared as external.
c--------------------------------------------------------
      subroutine fd(neqn,x,y,f)
c ----- brusselator with diffusion in 1 dim. space -----
      implicit double precision (a-h,o-z)
      dimension y(neqn),f(neqn)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth
c ----- constants for inhomogenity -----
      ans=ns
      radsq=0.1d0**2
c ----- big loop -----
      f(1)      = 0.d0
      f(2)      = 0.d0
      f(3)      = 0.d0
      f(3*ns-2) = 0.d0
      f(3*ns-1) = 0.d0
      f(3*ns)   = 0.d0
      do i=2,ns-1
c ----- left neighbour -----
c         if(i.eq.2)then
            uleft=y((i-1)*3-2)
            vleft=y((i-1)*3-1)
            wleft=y((i-1)*3)
c         else
c            uleft=y((i-1)*3-2)
c            vleft=y((i-1)*3-1)
c            wleft=y((i-1)*3)
c         end if
c ----- right neighbour -----
c         if(i.eq.ns-1)then
            uright=y((i+1)*3-2)
            vright=y((i+1)*3-1)
            wright=y((i+1)*3)
c         else
c            uright=y((i+1)*3-2)
c            vright=y((i+1)*3-1)
c            wright=y((i+1)*3)
c         end if
c ----- the derivative -----
         uij=y(i*3-2)
         vij=y(i*3-1)
         wij=y(i*3)
	   f(i*3-2)=alf*nssq*(uleft+uright-2.d0*uij)
         f(i*3-1)=alf*nssq*(vleft+vright-2.d0*vij)
         f(i*3)  =alf*nssq*(wleft+wright-2.d0*wij)
      end do
      return
      end  

c--------------------------------------------------------
c     The subroutine FA (advection terms)
c     has to be declared as external.
c--------------------------------------------------------
      subroutine fa(neqn,x,y,f)
      implicit double precision (a-h,o-z)
      dimension y(neqn),f(neqn)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth
c		  write (6,*) 'warning, dummy function fa called !!'
c ----- big loop -----
      f(1)      = 0.d0
      f(2)      = 0.d0
      f(3)      = 0.d0
      f(3*ns-2) = 0.d0
      f(3*ns-1) = 0.d0
      f(3*ns)   = 0.d0
      do i=2,ns-1
c ----- left neighbour -----
c         if(i.eq.2)then
            uleft=y((i-1)*3-2)
            vleft=y((i-1)*3-1)
            wleft=y((i-1)*3)
c         else
c            uleft=y((i-1)*3-2)
c            vleft=y((i-1)*3-1)
c           wleft=y((i-1)*3)
c         end if
c ----- right neighbour -----
c         if(i.eq.(ns-1))then
            uright=y((i+1)*3-2)
            vright=y((i+1)*3-1)
            wright=y((i+1)*3)
c         else
c            uright=y((i+1)*3-2)
c            vright=y((i+1)*3-1)
c            wright=y((i+1)*3)
c        end if
c ----- the derivative -----
         uij=y(i*3-2)
         vij=y(i*3-1)
         wij=y(i*3)
	   f(i*3-2)=0.5d0*(ns-1)*(uxadv*(uright-uleft))
         f(i*3-1)=0.5d0*(ns-1)*(vxadv*(vright-vleft))
         f(i*3)  =0.5d0*(ns-1)*(wxadv*(wright-wleft))
      end do
			return
      end  
c--------------------------------------------------------
c     The subroutine FD2 (non-symmetric diffusion)
c     has to be declared as external.
c--------------------------------------------------------
      subroutine fd2(neqn,x,y,f)
      implicit double precision (a-h,o-z)
      dimension y(neqn),f(neqn)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth
		  write (6,*) 'warning, dummy function fd2 called !!'
			do i=1,neqn
			f(i)=0.0d0
			end do
			return
      end  
c--------------------------------------------------------
c     The subroutine FR (reaction terms)
c     has to be declared as external.
c--------------------------------------------------------
      subroutine fr(neqn,npdes,ieqn,x,y,f,frjac,is_frjac)
      implicit double precision (a-h,o-z)
      dimension y(npdes),f(npdes),frjac(npdes,npdes)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth
			logical is_frjac
	uij=y(1)
      vij=y(2)
      wij=y(3)
      f(1)=brussa -(wij+1.d0)*uij +uij*uij*vij 
      f(2)=wij*uij -vij*uij*uij
      f(3)=(brussb-wij)/eps -wij*uij
	if (is_frjac) then
	  frjac(1,1)=-(wij+1.d0) + 2.d0*uij*vij
	  frjac(2,1)=wij -2.d0*uij*vij
        frjac(3,1)=-wij

	  frjac(1,2)=uij*uij 
	  frjac(2,2)=-uij*uij
        frjac(3,2)=0.d0

        frjac(1,3)=-uij
	  frjac(2,3)=uij
        frjac(3,3)=-(1.d0/eps) -uij
	end if
	    
	return
      end  
c--------------------------------------------------------
c     The subroutine FW (noise terms)
c     has to be declared as external.
c--------------------------------------------------------
      subroutine fw(neqn,x,y,f)
      implicit double precision (a-h,o-z)
      dimension y(neqn),f(neqn)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,eps,
     &    brussa,brussb,uxadv,vxadv,wxadv,uyadv,vyadv,wyadv,imeth
		write (6,*) 'WARNING DUMMY FUNCTION FW CALLED'
		  do i=1,neqn
			f(i)=0.d0
			end do
		  return
      end  