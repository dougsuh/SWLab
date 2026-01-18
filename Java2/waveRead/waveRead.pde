import java.io.*;
// WAV params (assumes 44.1kHz, 16-bit stereo PCM like doremi.wav)
int sampleRate, channels, bitsPerSample;
int totalSamples;
float[] leftChannel, rightChannel;

void setup() {
  try {
    readWav("doremi.wav");
    println("Channels: " + channels + ", SampleRate: " + sampleRate + 
            ", Bits: " + bitsPerSample + ", TotalSamples: " + totalSamples);
  } catch (IOException e) {
    e.printStackTrace();
  }
  size(800, 400);
}

void readWav(String filename) throws IOException {
  File file = new File(sketchPath(filename));
  DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(file)));

  // Skip RIFF header (12 bytes)
  skipFully(in, 12);

  // fmt chunk (assume standard 44 bytes total header)
  skipFully(in, 4);  // "fmt " chunk ID
  int fmtSize = readLEInt(in);
  if (fmtSize != 16) throw new IOException("Non-PCM or extended fmt");

  int audioFormat = readLEShort(in);  // should be 1
  channels = readLEShort(in);
  sampleRate = readLEInt(in);
  readLEInt(in);  // byteRate
  readLEShort(in); // blockAlign
  bitsPerSample = readLEShort(in);

  // Skip to data chunk
  skipFully(in, 4);  // "data" ID
  int dataSize = readLEInt(in);  // bytes of audio data
  totalSamples = dataSize / (channels * (bitsPerSample / 8));

  // Read all samples (interleaved)
  int samplesToRead = min(44100 * 2, totalSamples);  // first 2 sec
  leftChannel = new float[samplesToRead];
  rightChannel = new float[samplesToRead];

  for (int i = 0; i < samplesToRead; i++) {
    short left = readLEShort(in);
    short right = readLEShort(in);
    leftChannel[i] = left / 32768.0;   // normalize [-1,1]
    rightChannel[i] = right / 32768.0;
  }
  in.close();
}

// Little-endian helpers
short readLEShort(DataInputStream in) throws IOException {
  return (short)(in.readUnsignedByte() | (in.readUnsignedByte() << 8));
}

int readLEInt(DataInputStream in) throws IOException {
  return (in.readUnsignedByte()) |
         (in.readUnsignedByte() <<  8) |
         (in.readUnsignedByte() << 16) |
         (in.readUnsignedByte() << 24);
}
void skipFully(DataInputStream in, int bytes) throws IOException {
  long skipped = in.skip(bytes);
  if (skipped != bytes) throw new IOException("Short skip");
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (leftChannel != null) {
    float scaleY = height * 0.4;
    float scaleX = width / (float)leftChannel.length;
    beginShape();
    for (int i = 0; i < leftChannel.length; i++) {
      vertex(i * scaleX, height/2 - leftChannel[i] * scaleY);
    }
    endShape();
    
    stroke(255, 0, 0);
    beginShape();
    for (int i = 0; i < rightChannel.length; i++) {
      vertex(i * scaleX, height/2 + rightChannel[i] * scaleY);
    }
    endShape();
  }
}
