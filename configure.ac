#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.67])
AC_INIT([CSDP], [6.2], [dimpase@gmail.com])
AM_INIT_AUTOMAKE
LT_PREREQ([2.2])
LT_INIT([dlopen,disable-shared,no-undefined])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([solver/csdp.c])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AM_PROG_CC_C_O

AC_CONFIG_FILES([Makefile lib/Makefile solver/Makefile include/Makefile
                 example/Makefile theta/Makefile])
#                 doc/Makefile test/Makefile 
                 


# Checks for libraries.
# FIXME: Replace `main' with a function in `-lblas':
#AC_CHECK_LIB([blas], [dnrm2])

AX_BLAS([have_blas=yes], [have_blas=no])
if test "x${have_blas}" = xno; then          
    AC_MSG_ERROR([
  ------------------------------------------ 
   A BLAS library and header file required to build csdp. Stopping...
   Check 'config.log' for more information.
  ------------------------------------------])
fi

AX_LAPACK([have_lapack=yes], [have_lapack=no])
if test "x${have_lapack}" = xno; then          
    AC_MSG_ERROR([
  ------------------------------------------ 
   A LAPACK library and header file required to build csdp. Stopping...
   Check 'config.log' for more information.
  ------------------------------------------])
fi

# these are taken care by AX_LAPACK/BLAS:
# # FIXME: Replace `main' with a function in `-lgfortran':
# AC_CHECK_LIB([gfortran], [main])
# # FIXME: Replace `main' with a function in `-llapack':
# AC_CHECK_LIB([lapack], [main])
# # FIXME: Replace `main' with a function in `-lsdp':
# AC_CHECK_LIB([sdp], [main])

AC_CHECK_LIB(m, sqrt)

# Checks for header files.
AC_CHECK_HEADERS(limits.h stddef.h stdlib.h string.h sys/time.h unistd.h)

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_STRTOD
AC_CHECK_FUNCS(gettimeofday pow sqrt strtol)

AC_OUTPUT
