n1 = 4;       
n2 = 4
 
X_train ReadData('zy','zz',n1, n2)       # To read multiple files 
 
y_train = [ones(n1, 1) ; zeros(n2,1)];
y_train = categorical(y_train);

% Plotting features of a particular observation with time steps.
figure 
plot(X_train{1}')
xlabel('Time Step')
title('Training Observation') 
num_features = size(X_train{1}, 1);
legend('Feature ' + string(1:num_features),'Location','northeastoutside')

%Padding: to make each sequence of almost same length
num_observation = numel(X_train);
for i = 1:num_observation
    sequence = X_train{i};
    sequence_lengths(i) = size(sequence,2);
end    

% Sorting the seqeunces 
[sequence_lengths, idx] =  sort(sequence_lengths);
X_train = X_train(idx);
y_train = y_train(idx);

% Defining LSTM Network

input_size = num_features;
num_hidden_units_1 = 90;
num_classes = 2;
%num_hidden_units_2 = 25;

layers = [ ...
    sequenceInputLayer(input_size)
    bilstmLayer(num_hidden_units_1,'OutputMode','last')
   % bilstmLayer(num_hidden_units_2,'OutputMode','last')
    fullyConnectedLayer(num_classes)
    softmaxLayer 
    classificationLayer]

max_epochs = 200;
mini_batch_size = 20;
initial_learning_rate = 0.01;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'GradientThreshold',1, ...
    'MaxEpochs',max_epochs, ...
    'InitialLearnRate',initial_learning_rate, ...
    'MiniBatchSize',mini_batch_size, ...
    'SequenceLength','longest', ...
    'Shuffle','never', ...
    'Verbose',0, ...
    'Plots','training-progress');

net = trainNetwork(X_train,y_train,layers,options);

function f = filter(x)
    
    z = [4,5,6,10,11,12,13,14,15,19,20,21,22,23,24,26,27,28,29,30,32,35,39,40,43,47,48,49,54,60,75,76,77,78,83,84,85,87,88,91,92,93,95,99,100,102,103,104,106,107,108,109,110,115,131,132,135,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,154,155,156,157,158,159,160,162,163,164,165,166,167,168,170,171,172,173,174,175,176,181,182,183,186,190];
    m = size(x);
    num_z = size(z); 
    f = zeros(m(1),1);
    
    for i = 1:num_z(2)
        f = [f , x(:,z(i))];
    end
    num_f = size(f)
    f = f(:,2:num_f(2));
end   

function X_train = ReadData(fileName1,fileName2,n1, n2)
    
      for i = 1:n1
        var = csvread(strcat('M064_',fileName1,num2str(i),'.csv'));
        var = filter(var);
        drift_shift = sum(abs(var(1:50,:)))./50
        var = var - drift_shift; 
        X_train{i} = var';
      end

      for i = 1:n2
          var = csvread(strcat('M064_', fileName2, num2str(i+n1),'.csv'));
          var = filter(var);
          drift_shift = sum(var(1:50,:))./50
          var = var - drift_shift; 
          X_train{i+3} = var';
      end

      X_train = X_train';
end   

