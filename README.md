# Background

The project concerns the assessment of foot disease using load measurement
systems which obtains 3 axis loads information across
an array of measurement points.

Both systems will produce load maps – in slightly different shapes but essentially the same; N
nodes each measuring load (force) in 3 axes XYZ. To develop this research we currently have a 64
node system “MagBoard” and two simulator systems which mimic footsteps on the
sensing surface. 

# Project Details

The main focus of your project is to apply machine learning techniques (e.g. neural networks) to
analyse the ‘load maps’ obtained from these sensory systems. In particular, we’re interested in being
able to:

Differentiate (and classify) healthy and diseased foot profiles (we will make model feet with different mechanical properties / shapes to represent this)

# Architechture

In this research, we have proposed a Bidirectional LSTM (Long Short Term Memory) network 
for this binary classification. LSTM network is most suitable model for this 
dataset as it allows sequence data as an input, and make prediction based 
on the individual time steps of sequence data.

# Acknowledgement

I would like to thank Prof. Peter Culmer, University of Leeds for the Testing dataset.
