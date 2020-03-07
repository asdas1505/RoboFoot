Project: DFU Detection and Visualization

## This file contains documentation for RoboFoot_LSTM.m

Two Functions are defined at the bottom of the scripts:

1.  filter():

	arguments: x              # x is training set
	return: f 		  # f is preprocessed data with considering only important features.	 	


2.  ReadData(): 

	arguments: fileName1, filname2, n1, n2. 	
	return: X_train                                # Training Set
		
    Two for loops, first for label 0 and second for label 1.	    

    This code is used to load the data file and preprocess it using filter function and stored it in a variable var.
     	
	var = csvread(strcat('M064_',fileName1,num2str(i),'.csv'));
        var = filter(var);
	
    This line was used to remove negative y offset from the data.  
	
	drift_shift = sum(abs(var(1:50,:)))./50
	var = var - drift_shift;
  		
    Taking transpose of var and storing it in a cell array named X_train.	
    	
	X_train{i} = var';


y_train is generated according to the ReadData using n1, n2. 
	
 	y_train = [ones(n1, 1) ; zeros(n2,1)];	
	y_train = categorical(y_train);	

Visualizing the i th time series in a plot. Each line corresponds to a feature.
    	
	figure
	plot(XTrain{i}')
	xlabel("Time Step")
	title("Training Observation 1")
	numFeatures = size(XTrain{i},1);
	legend("Feature " + string(1:numFeatures),'Location','northeastoutside')


During Training, data splits into mini-batches and sequences are padded so that they have the same length.
To reduce training time process, training data is sorted by sequence length.
 
Getting the sequence lengths for each observation.

	num_observation = numel(X_train);
	for i = 1:num_observation
            sequence = X_train{i};
    	    sequence_lengths(i) = size(sequence,2);
	end   

Sorting the data by sequence length.

	[sequence_lengths, idx] =  sort(sequence_lengths);
	X_train = X_train(idx);
	y_train = y_train(idx);


Classification Model sequences:

Bidirectional LSTM's are used as whole sequence is used as an input to the classification model.
Bidirectional LSTM layer learns from the full sequence at each time step.

Define a LSTM network and specify input size, number of hidden units and number of output classes.

	input_size = num_features;
	num_hidden_units_1 = 90;
	num_hidden_units_2 = 25;
	num_classes = 2;

	layers = [ ...
    	    sequenceInputLayer(input_size)
    	    bilstmLayer(num_hidden_units_1,'OutputMode','sequence')
    	    bilstmLayer(num_hidden_units_2,'OutputMode','last')
    	    fullyConnectedLayer(num_classes)
    	    softmaxLayer 
    	    classificationLayer]

Specifying the training parameters:

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

Training the model:

net = trainNetwork(X_train,y_train,layers,options);




















