c
c
c =========================================================
       subroutine qinit(maxmx,meqn,mbc,mx,xlower,dx,q,maux,aux)
c =========================================================
c
c     # Set initial conditions for q.
c     # Pulse in pressure, zero velocity
c
c
      implicit double precision (a-h,o-z)
      dimension q(1-mbc:maxmx+mbc, meqn)
      dimension aux(1-mbc:maxmx+mbc, *)
c
c
      do 150 i=1,mx
         xcell = xlower + (i-0.5d0)*dx
         q(i,1) = dexp(-50 * (xcell-0.3d0)**2)  
     &            * dcos(20.d0*(xcell-0.3d0))
         if (xcell .gt. 0.30d0) q(i,1) = 0.d0
         q(i,2) = 0.d0
  150    continue
c
      return
      end
