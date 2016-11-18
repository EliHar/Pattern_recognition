# Face Recognition

### Install Docker
[Installation guide](https://docs.docker.com/engine/getstarted/step_one/)</br>
[Docker commands](https://docs.docker.com/engine/reference/commandline/)

### Pull Docker container
<code>docker pull elihar/openface</code>

### Run Docker container
<code>docker run -v [shared/directory/path]:/root/openface/shared -p 9000:9000 -p 8000:8000 -t -i elihar/openface /bin/bash</code>

### Go to openface directory
<code>cd /root/openface</code>

### Add training data
Add images of people to be classified in directories named after each person. These will be the classes. Then move these directories to <code>./training-images/</code>

### Face detection, cropping, pose detection and alignment
<code>pose_detect_align</code>

### Extract 128 features per face and generate a face representation
<code>gen_rep</code>

### Train a face detection model
<code>train_model</code>

### Recognize an unknown face
<code>recognize [image/path]</code>

#####[Original resource](https://medium.com/@ageitgey/machine-learning-is-fun-part-4-modern-face-recognition-with-deep-learning-c3cffc121d78#.fh7imzgnm)
