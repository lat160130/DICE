function [is_parametric_mat] = check_parametric(varargin)

% == Goal ================================================================= Goal
% Take in n >= 1 data sets and check if they are parametric.
% ========================================================================= Goal

% == Input Variables ====================================================== Input Variables
% Varargin - parametric tests can have >=1 data sets, this function takes
% 1 or more data sets.
% ========================================================================= Input Variables

% == Output Matrix ======================================================== Output Matrix
% This function returns a matrix.  It will say return which
% conditions were violated for each input matrix. 
% ========================================================================= Output Matrix

% == Useful knowledge ===================================================== Useful
% nargin = # of input arguments passed
% ========================================================================= Useful

% == Setup ================================================================ Setup
% Rows are the assumption, columns are the index of the matrix entered.
% E.g.,  check_parametric(matrix_1, matrix_2):
% Column one has the assumption results for matrix_1, and column 2 has the 
% assumption results for matrix_2.

is_parametric_mat = -1*ones(4,nargin);
% ========================================================================= Setup

% == 1. Check Normality =================================================== 1. Normality

% ========================================================================= 1. Normality

% -- TESTING -------------------------------------------------------------- TESTING
% for users - leave this commented out - use and abuse at your own risk
disp(varargin);
disp(nargin);
% ------------------------------------------------------------------------- TESTING
end

