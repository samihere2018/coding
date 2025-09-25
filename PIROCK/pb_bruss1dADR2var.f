c Brusselator problem with advection, nonstiff reaction
c--------------------------------------------------------
c    2D Brusselator problem with nonstiff reaction and advection
c--------------------------------------------------------
c    This driver shows how to use PIROCK. It solves a
c    system of ODEs resulting from the 1-dimensional space 
c    discretization of the Brusselator equations (u=u(x,t),v=v(x,t)):
c     
c    u_t=1.3+u^2*v-2.*u+(-0.5*u_x)+0.01*(u_{xx})
c    v_t=1.*u-u^2*v+(-0.4*v_x)+0.01*(v_{xx})   for t>=0, 0<= x <= 1
c
c    with initial conditions 
c
c    u(x,0)=22*x*(1-x)^{3/2}  v(x,0)=27*x*(1-x)^{3/2}
c
c    and periodic boundary conditions
c
c    u(x+1,t)=u(x,t),  v(x+1,t)=v(x,t).
c
c    We discretize the space variables with
c    x_i=i/(N+1), for i=0,1,...,N, with N=400. 
c    We obtain a system of 800 equations. 
c
c--------------------------------------------------------

      SUBROUTINE init(nsd,t,tend,y)
			implicit double precision (a-h,o-z)
      double precision  y(*)
			
c --- common parameters for the problem -----
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth

c ----- dimensions -----
      neqn=nsd*2
      ns=nsd
      nssq=ns*ns
      nsnsm1=ns*(ns-1)
	alf=1.d-2
      amult=1.d0
      amult=1.d-1
      amult=1.d0
      uxadv=-.5d0  *amult
      uyadv=0.d0  *amult
      vxadv=.4d0   *amult
      vyadv=.0d0   *amult
      brussa=1.3d0
      brussb=1.0d0
			
			


      write(6,*) 'Integration of the '
     &   ,'1-dim Brusselator problem, ns=',ns
c ----- initial and end point of integration -----
      t=0.0d0
      tend=1.d0
c ----- initial values -----
      ans=ns
c      do j=1,ns
c        yy=(j-1)/ans
        do i=1,ns
          xx = (i-1)/ns  
          y((i)*2-1)=22.d0*xx*(1.d0-xx)**(1.5d0) 
        end do
c      end do

c      do i=1,ns
c        xx=(i-1)/ans
        do i=1,ns
           xx=(i-1)/ans
           y((i)*2)=27.d0*xx*(1.d0-xx)**(1.5d0)
        end do
c     end do
c
	radadv=rhoadv(neqn,t,y)
	write (6,*) 'amult',amult,'adv spectral radius',radadv
      return
      end
			
      SUBROUTINE solout(neqn,t,tend,y,ytmp)
			implicit double precision (a-h,o-z)
      double precision  y(neqn),ytmp(neqn)
			
c --- common parameters for the problem -----
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth

c ----- file for solution -----
       open(8,file='sol.dat')
       rewind 8
		  write (8,*) t,(y((i)*2-1),i=1,ns),
     &     (y((i)*2),i=1,ns)

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
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth
c        rhodiff = 8.0d0*nssq*alf 
        rhodiff = 4.0d0*nssq*alf 
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
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth
c        rhoadv = (abs(uxadv)+abs(vxadv)+abs(uyadv)+abs(vyadv))*ns 
        rhoadv = (abs(uxadv)+abs(vxadv))*ns
c        rhoadv = sqrt((uxadv)**2+(vxadv)**2+(uyadv)**2+(vyadv)**2)*ns
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
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth
c ----- constants for inhomogenity -----
      ans=ns
      radsq=0.1d0**2
c ----- big loop -----
      do i=1,ns
c ----- left neighbour -----
         if (i.eq.1)then
            uleft=y((i+ns-1)*2-1)
            vleft=y((i+ns-1)*2)
         else
            uleft=y((i-1)*2-1)
            vleft=y((i-1)*2)
         end if
c ----- right neighbour -----
         if (i.eq.ns)then
            uright=y((i-ns+1)*2-1)
            vright=y((i-ns+1)*2)
         else
            uright=y((i+1)*2-1)
            vright=y((i+1)*2)
         end if
c ----- lower neighbour -----
c         if(i.le.ns)then
c            ulow=y((i+nsnsm1)*2-1)
c            vlow=y((i+nsnsm1)*2)
c         else
c            ulow=y((i-ns)*2-1)
c            vlow=y((i-ns)*2)
c         end if
c ----- upper neighbour -----
c         if(i.gt.nsnsm1)then
c            uup=y((i-nsnsm1)*2-1)
c            vup=y((i-nsnsm1)*2)
c         else
c            uup=y((i+ns)*2-1)
c            vup=y((i+ns)*2)
c         end if
c ----- the derivative -----
         uij=y(i*2-1)
         vij=y(i*2)
         f(i*2-1)=alf*nssq*(uleft+uright-2.d0*uij)
         f(i*2)=alf*nssq*(vleft+vright-2.d0*vij)
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
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth	
c ----- big loop -----
      do i=1,ns
c ----- left neighbour -----
         if(i.eq.1)then
            uleft=y((i+ns-1)*2-1)
            vleft=y((i+ns-1)*2)
         else
            uleft=y((i-1)*2-1)
            vleft=y((i-1)*2)
         end if
c ----- right neighbour -----
         if(i.eq.ns)then
            uright=y((i-ns+1)*2-1)
            vright=y((i-ns+1)*2)
         else
            uright=y((i+1)*2-1)
            vright=y((i+1)*2)
         end if
c ----- lower neighbour -----
c         if(i.le.ns)then
c            ulow=y((i+nsnsm1)*2-1)
c            vlow=y((i+nsnsm1)*2)
c         else
c            ulow=y((i-ns)*2-1)
c            vlow=y((i-ns)*2)
c         end if
c ----- upper neighbour -----
c         if(i.gt.nsnsm1)then
c            uup=y((i-nsnsm1)*2-1)
c            vup=y((i-nsnsm1)*2)
c         else
c            uup=y((i+ns)*2-1)
c            vup=y((i+ns)*2)
c         end if
c ----- the derivative -----
         uij=y(i*2-1)
         vij=y(i*2)
		     f(i*2-1)=0.5d0*ns*(uxadv*(uright-uleft))
     &        +brussa+uij*uij*vij-(brussb+1.d0)*uij
         f(i*2)=0.5d0*ns*(vxadv*(vright-vleft))
     &        +brussb*uij - uij*uij*vij				
			end do
			return
      return
      end  
c--------------------------------------------------------
c     The subroutine FD2 (non-symmetric diffusion)
c     has to be declared as external.
c--------------------------------------------------------
      subroutine fd2(neqn,x,y,f)
      implicit double precision (a-h,o-z)
      dimension y(neqn),f(neqn)
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth
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
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth
			logical is_frjac
      write (6,*) 'WARNING DUMMY FUNCTION FR CALLED'
			f(1)=0.d0
			f(2)=0.d0
			if (is_frjac) then
			frjac(1,1)=0.d0
			frjac(2,1)=0.d0
			frjac(1,2)=0.d0
			frjac(2,2)=0.d0
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
      common/trans/alf,ns,nssq,nsnsm1,nsm1sq,
     &    brussa,brussb,uxadv,vxadv,uyadv,vyadv,imeth
		  write (6,*) 'WARNING DUMMY FUNCTION FW CALLED'
		  do i=1,neqn
			f(i)=0.d0
			end do
		  return
      end  