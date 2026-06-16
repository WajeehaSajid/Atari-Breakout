
# Atari Breakout — x86 Assembly (DOS)

A fully functional **Breakout-style arcade game** written in **x86 Assembly language**, designed to run on DOSBox. Built as a low-level systems programming project using DOS BIOS interrupts for graphics, keyboard input, and file I/O.

---

## Demo

https://github.com/user-attachments/assets/7dc6f0cd-a484-406b-9ea3-c61529c3aa33

---

## Features

- **24 brick blocks** arranged in 4 color-coded rows across multiple levels
- **Paddle control** with smooth movement using keyboard interrupts
- **Power-ups** — catch a `2x` item to double your score temporarily
- **3-life system** — lose a life when the ball falls below the paddle
- **Persistent high score** — saved and loaded from `high.bin` using DOS file I/O
- **Timer display** — tracks minutes and seconds using the timer ISR (INT 8)
- **Level progression** — ball speed increases as you clear bricks
- **Restart or Quit** from the Game Over screen

---

## Controls

| Key            | Action         |
|----------------|----------------|
| `←` Left Arrow | Move paddle left |
| `→` Right Arrow | Move paddle right |
| `ESC`          | Quit game      |
| `Enter`        | Restart (on Game Over screen) |

---

## How to Run

### Requirements
- [DOSBox](https://www.dosbox.com/) — free DOS emulator

### Steps

1. Download or clone this repository
2. Open **DOSBox**
3. Mount the project folder:
   ```
   mount c C:\path\to\Atari-Breakout-x86
   ```
4. Switch to the drive:
   ```
   c:
   ```
5. Run the game:
   ```
   Atari_breakout.com
   ```

> The game will automatically create `high.bin` to save your high score.

---

## Build from Source

To assemble the `.asm` file into a runnable `.com` binary, you need **NASM**:

### Install NASM
Download from [https://www.nasm.us/](https://www.nasm.us/)

### Assemble
```bash
nasm -f bin Atari_breakout.asm -o Atari_breakout.com
```

Then run `Atari_breakout.com` in DOSBox as described above.

---

---

## Technical Details

| Property        | Detail                          |
|-----------------|---------------------------------|
| Architecture    | x86 (16-bit, COM format)        |
| Assembler       | NASM                            |
| Platform        | DOS / DOSBox                    |
| Graphics        | BIOS INT 10h (text mode)        |
| Keyboard Input  | Hardware ISR via INT 9 hook     |
| Game Loop       | Timer ISR via INT 8 hook        |
| File I/O        | DOS INT 21h (high score saving) |
| Language        | x86 Assembly (`.asm`)           |

---

---

## License

This project is open source and available under the [MIT License](LICENSE).
