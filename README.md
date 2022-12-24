# LPQ-method
Local phase quantization (LPQ) is an image descriptor that is robust to centrally symmetric blur.A 2-D convolution
can be computed between the original image and the point spread function (SPD) of the blurred image.Then, for each pixel computes the local spectrum based on
the short term Fourier transform (STFT) in the vicinity that is containing four low frequency components.These components form a vector consist of real and imaginary
parts.

Article : L. Ghiani, G. L. Marcialis, and F. Roli, “Fingerprint liveness detection by local phase quantization,” 
Proc. - Int. Conf. Pattern Recognit., no. Icpr, pp. 537–540, 2012.

fscore file : calculates Accuracy, Sensitivity, Specificity, Precision, Recall, F-Measure, G-mean of the model

Other files contain noisy model.
