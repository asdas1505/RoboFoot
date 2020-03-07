# Background

We have two linked projects which concern the assessment of foot disease using load measurement
systems that we’re developing, one is the SLIPS system (link below, we’ve discussed previously) and
the second is a load platform which obtains similar measurements (3 axis loads information across
an array of measurement points).

Both systems will produce load ‘maps’ – in slightly different shapes but essentially the same; N
nodes each measuring load (force) in 3 axes XYZ. To develop this research we currently have a 64
node system “MagBoard” – see below – and two simulator systems which mimic footsteps on the
sensing surface. You can see below an idea of the results that are obtained (also see my Twitter
feed, linked off the website, for some videos!). We are expected a larger MagBoard 128 to be ready
over the coming months (suitable for full size feet!).

# Project Details

The main focus of your project is to apply machine learning techniques (e.g. neural networks) to
analyse the ‘load maps’ obtained from these sensory systems. In particular, we’re interested in being
able to:

a) Differentiate (and classify) healthy and diseased foot profiles (we will make model feet with
   different mechanical properties / shapes to represent this)
b) Locate ‘hot-spots’ where the load distribution differs from ‘healthy’ (e.g. identify where an
   ulcer may be forming)
