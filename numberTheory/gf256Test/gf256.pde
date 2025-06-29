// Java does not support unsigned byte
public class GF256 {
    private static final int FIELD_SIZE = 256;
    private static final int PRIMITIVE_POLYNOMIAL = 0x11d;

    private final int[] expTable = new int[FIELD_SIZE * 2];
    private final int[] logTable = new int[FIELD_SIZE];

    public GF256() {
        initializeTables();
    }

    private void initializeTables() {
        int x = 1;
        for (int i = 0; i < FIELD_SIZE; i++) {
            expTable[i] = x;
            logTable[x] = i;

            x <<= 1; // multiply by 2
            if (x >= FIELD_SIZE) {
                x ^= PRIMITIVE_POLYNOMIAL;
            }
        }

        // Copy expTable[0..255] to expTable[256..511] for overflow handling
        for (int i = FIELD_SIZE; i < expTable.length; i++) {
            expTable[i] = expTable[i - FIELD_SIZE];
        }
    }

    public int add(int a, int b) {
        return a ^ b; // addition in GF(256) is XOR
    }

    public int subtract(int a, int b) {
        return a ^ b; // same as addition
    }

    public int multiply(int a, int b) {
        if (a == 0 || b == 0) return 0;
        int logSum = logTable[a] + logTable[b];
        return expTable[logSum];
    }

    public int inverse(int a) {
        if (a == 0) throw new ArithmeticException("Cannot invert 0 in GF(256)");
        return expTable[255 - logTable[a]];
    }

    public int divide(int a, int b) {
        if (b == 0) throw new ArithmeticException("Division by zero in GF(256)");
        if (a == 0) return 0;
        int logDiff = logTable[a] - logTable[b] + 255;
        return expTable[logDiff];
    }

    // Optional: for displaying as hex
    public String toHex(int value) {
        return String.format("0x%02X", value);
    }
}
