import cv2
from PIL import Image
import skimage.io as skio

import numpy as np
import time
import os
import matplotlib.pyplot as plt

np.random.seed(42)

def create_images(image_shape=(128,128)):
    w,h = image_shape
    im_arr = np.random.random((w,h,3)) * 255
    return im_arr.astype("uint8")

NUM_images = 10000
IMAGE_SIZE = (256,256)
NUM_RUNS = 10

try:
    os.makedirs("./tmp")
except:
    pass

null = [cv2.imwrite("./tmp/img_%s.png" % str(i).zfill(8), create_images(image_shape=IMAGE_SIZE)) for i in range(NUM_images)]


img_list = os.listdir("./tmp/")
img_list = [os.path.join("./tmp", i) for i in img_list]

# Test with cv2
time_record = []
for _ in range(NUM_RUNS):
    start_time = time.time()
    arr = [cv2.cvtColor(cv2.imread(i),cv2.COLOR_BGR2RGB) for i in img_list] # convert BGR to RGB
    arr = np.array(arr)
    print(arr.shape)
    end_time = time.time()
    print("Elapse time: %.4f seconds" % (end_time - start_time))
    time_record.append(end_time-start_time)
print("Average elapse time: %.4f" % np.mean(time_record))

# Test with PIL
time_record = []
for _ in range(NUM_RUNS):
    start_time = time.time()
    arr = [np.array(Image.open(i)) for i in img_list]
    arr = np.array(arr)
    print(arr.shape)
    end_time = time.time()
    print("Using PIL method, elapse time: %.4f seconds" % (end_time - start_time))
    time_record.append(end_time-start_time)
print("Average elapse time: %.4f" % np.mean(time_record))

# Test with Skimage
time_record = []
for _ in range(NUM_RUNS):
    start_time = time.time()
    arr = [skio.imread(i) for i in img_list]
    arr = np.array(arr)
    print(arr.shape)
    end_time = time.time()
    print("Using skimage method, elapse time: %.4f seconds" % (end_time - start_time))
    time_record.append(end_time-start_time)
print("Average elapse time: %.4f" % np.mean(time_record))


import shutil
shutil.rmtree("./tmp/")