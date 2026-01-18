// Make doremi.wav: 44.1 kHz, 16-bit, stereo, 3 notes * 2s (do, re, mi)
import java.io.*;
// Frequencies for C4 (do), D4 (re), E4 (mi)
float[] freqs = { 261.63, 293.66, 329.63 };  // Hz [web:28][web:30]
// WAV params
int sampleRate   = 44100;   // Hz [web:20]
int bitsPerSample = 16;     // 2 bytes/sample
int numChannels   = 2;      // stereo [web:20]
float noteDuration = 2.0;   // seconds each
int numNotes = 3;

void setup() {
  try {
    makeDoremiWav("doremi.wav");
    println("doremi.wav written.");
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
  noLoop();
}

void makeDoremiWav(String filename) throws IOException {
  int samplesPerNote = (int)(sampleRate * noteDuration);
  int totalSamplesPerChannel = samplesPerNote * numNotes;
  int byteRate   = sampleRate * numChannels * bitsPerSample / 8;
  int blockAlign = numChannels * bitsPerSample / 8;
  int dataSize   = totalSamplesPerChannel * blockAlign; // total bytes of audio
  int subchunk1Size = 16;   // PCM
  int audioFormat   = 1;    // PCM
  int subchunk2Size = dataSize;
  int chunkSize     = 4 + (8 + subchunk1Size) + (8 + subchunk2Size); // [web:18][web:19]

  File file = new File(sketchPath(filename));
  DataOutputStream out =
    new DataOutputStream(new BufferedOutputStream(new FileOutputStream(file)));

  // ---- RIFF header ----
  writeString(out, "RIFF");
  writeLEInt(out, chunkSize);
  writeString(out, "WAVE");

  // ---- fmt chunk ----
  writeString(out, "fmt ");
  writeLEInt(out, subchunk1Size);   // 16 for PCM
  writeLEShort(out, (short)audioFormat);   // 1 = PCM
  writeLEShort(out, (short)numChannels);   // 2 channels
  writeLEInt(out, sampleRate);            // 44100
  writeLEInt(out, byteRate);              // sampleRate * channels * bits/8
  writeLEShort(out, (short)blockAlign);   // channels * bits/8
  writeLEShort(out, (short)bitsPerSample);// 16 bits

  // ---- data chunk ----
  writeString(out, "data");
  writeLEInt(out, subchunk2Size);

  // ---- audio samples: do, re, mi ----
  double twoPi = 2 * Math.PI;
  double maxAmp = 0.7 * 32767.0; // simple attenuation

  int sampleIndex = 0;
  for (int n = 0; n < numNotes; n++) {
    float freq = freqs[n];
    for (int i = 0; i < samplesPerNote; i++, sampleIndex++) {
      double t = (double)sampleIndex / sampleRate;
      double sample = Math.sin(twoPi * freq * t);  // sine wave [web:22][web:28]

      short val = (short)(maxAmp * sample);

      // stereo: same sample to L and R
      writeLEShort(out, val); // Left
      writeLEShort(out, val); // Right
    }
  }

  out.flush();
  out.close();
}

// --- helper methods for little-endian writing ---

void writeString(DataOutputStream out, String s) throws IOException {
  out.writeBytes(s);
}

void writeLEInt(DataOutputStream out, int v) throws IOException {
  out.writeByte(v & 0xFF);
  out.writeByte((v >> 8) & 0xFF);
  out.writeByte((v >> 16) & 0xFF);
  out.writeByte((v >> 24) & 0xFF);
}

void writeLEShort(DataOutputStream out, short v) throws IOException {
  out.writeByte(v & 0xFF);
  out.writeByte((v >> 8) & 0xFF);
}
