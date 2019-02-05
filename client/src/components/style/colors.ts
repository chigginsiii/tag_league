interface ToneProfile {
  base: string,
  bright: string,
  brighter: string,
  dark: string,
  darker: string
}

interface ColorTones {
  white: string,
  black: string,
  primary: ToneProfile,
  secondary: ToneProfile,
  tertiary: ToneProfile,
  complent: ToneProfile,
}

const colors = {
  white: "#ffffff",
  black: "#000000",
  primary: {
    base: "#2b7e7e",
    bright: "#71bebe",
    brighter: "#dbefef",
    dark: "#006969",
    darker: "#004d4d"
  },
  secondary: {
    base: "#d35f47",
    bright: "#ffaa98",
    brighter: "#ffedea",
    dark: "#ae1e00",
    darker: "#801600"
  },
  tertiary: {
    base: "#339959",
    bright: "#7ed29d",
    brighter: "#e0f4e7",
    dark: "#007f2f",
    darker: "#005d23"
  },
  complement: {
    base: "#d38647",
    bright: "#ffc798",
    brighter: "#fff3ea",
    dark: "#ae4f00",
    darker: "#803a00"
  }
};

export default colors;
