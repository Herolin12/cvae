-- Format taken from y0ast: https://github.com/y0ast/VAE-Torch.git
require 'hdf5'
require 'torch'
function loadmnist()
   -- This loads an hdf5 version of the MNIST dataset used here:
   -- http://deeplearning.net/tutorial/gettingstarted.html
   -- Direct link: http://deeplearning.net/data/mnist/mnist.pkl.gz

   local f = hdf5.open('datasets/mnist.hdf5', 'r')

   data = {}
   data.train = f:read('x_train'):all():double()
   data.test = f:read('x_test'):all():double()
   f:close()

   return data
end

function loadflipshift()
   -- This loads a data of a picture of an object in various positions
   local f = hdf5.open('datasets/flipshift.hdf5', 'r')
   data = {}
   data.train = f:read('dataset'):all():double()
   f:close()
   return data
end

function loadghost()
   local f = hdf5.open('animate/ghost.h5', 'r')
   data = {}
   data.train = f:read('dataset'):all():double()
   f:close()
   return data
end

function loadupdown()
   -- This loads a data of a picture of an object in various positions
   data = {}
   data.train = torch.load('datasets/updown.t7')
   return data
end

