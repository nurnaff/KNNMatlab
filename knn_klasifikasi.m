training=xlsread('data_training.xls','B2:G91');
kelas=importdata('kelas_mangga.txt');
ujicoba=xlsread('dt_testing.xls','B2:G2');
c = fitcknn(training, kelas,'NumNeighbors',5,'Standardize',1);
Class = predict(c,ujicoba);