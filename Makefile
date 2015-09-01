main=convert_littler
FC = gfortran
FFLAGS = -Wimplicit-interface -ludunits -ffree-form

all: f_udunits_2.f90 check_status.f90 write_littler.f90 readncdf.f90 logging.f90 convert_littler.f90
	$(FC) $(FFLAGS) -c f_udunits_2.f90 
	$(FC) $(FFLAGS) -c check_status.f90 
	$(FC) $(FFLAGS) -c write_littler.f90
	$(FC) $(FFLAGS) -c logging.f90
	$(FC) $(FFLAGS) -c readncdf.f90 check_status.f90  -L/usr/lib -I/usr/include -lnetcdf -lnetcdff
	$(FC) $(FFLAGS) -o $(main) convert_littler.f90 f_udunits_2.f90 check_status.f90 readncdf.f90 write_littler.f90 logging.f90 -L/usr/lib -I/usr/include -lnetcdf -lnetcdff -Wimplicit-interface -ludunits -ffree-form
	
clean :
	rm -f *.mod *.pcl *.pc *.o $(main) *.vo *.d
