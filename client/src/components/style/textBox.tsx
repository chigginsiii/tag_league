import React, { ReactNode } from 'react'
import styled from '@emotion/styled'
import text from './text'
import colors from './colors'

interface TextFamilyProps {
  cursive?: boolean
  sans?: boolean
}

interface TextSizeProps {
  xs?: boolean
  sm?: boolean
  md?: boolean
  lg?: boolean
  xl?: boolean
}

interface TextSchemeProps {
  primary?: boolean
  secondary?: boolean
  tertiary?: boolean
  complement?: boolean
}

interface TextToneProps {
  base?: boolean
  bright?: boolean
  brighter?: boolean
  dark?: boolean
  darker?: boolean
}

interface TextStyleProps {
  famProp: keyof (TextFamilyProps)
  sizeProp: keyof (TextSizeProps)
  schemeProp: keyof (TextSchemeProps)
  toneProp: keyof (TextToneProps)
}

const TextStyle = styled.div(({
  famProp,
  sizeProp,
  schemeProp,
  toneProp
}: TextStyleProps) => ({
  fontFamily: text.font[famProp],
  fontSize: text.size[sizeProp],
  color: colors[schemeProp][toneProp]
}))

type TextBoxPropBase = TextFamilyProps & TextSizeProps & TextSchemeProps & TextToneProps
interface TextBoxProps extends TextBoxPropBase {
  children: ReactNode
}

const TextBox = (props: TextBoxProps) => {
  const famProp = props.cursive ? 'cursive' : 'sans'
  const sizeProp = ['xs', 'sm', 'md', 'lg', 'xl'].find(abbrev => (props as any)[abbrev])
  const schemeProp = ['primary', 'secondary', 'tertiary', 'complement'].find(sch => (props as any)[sch])
  const toneProp = ['base', 'bright', 'brighter', 'dark', 'darker'].find(tone => (props as any)[tone])

  return (
    <TextStyle
      famProp={famProp || 'sans'}
      sizeProp={sizeProp || 'md' as any}
      schemeProp={schemeProp || 'primary' as any}
      toneProp={toneProp || 'base' as any}
    >
      {props.children}
    </TextStyle >
  )
}

export default TextBox
