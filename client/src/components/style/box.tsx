import React, { ReactNode } from "react";
import styled, { CSSObject } from "@emotion/styled";

type Spacing = 0 | 2 | 4 | 6 | 8 | 12 | 16 | 20 | 24

interface BoxProps {
  m?: Spacing
  mx?: Spacing
  my?: Spacing
  mt?: Spacing
  mb?: Spacing
  ml?: Spacing
  mr?: Spacing
  p?: Spacing
  px?: Spacing
  py?: Spacing
  pt?: Spacing
  pb?: Spacing
  pl?: Spacing
  pr?: Spacing
  children: ReactNode
}

interface BoxInnerProps {
  margin: CSSObject
  padding: CSSObject
}
const BoxInner = styled.div(({ margin, padding }: BoxInnerProps) => [margin, padding])

const Box = ({ m, mx, my, mt, mb, ml, mr, p, px, py, pt, pb, pl, pr, children }: BoxProps) => {
  let margin = { marginTop: 0, marginRight: 0, marginBottom: 0, marginLeft: 0 }
  if (m) margin = { marginTop: m, marginRight: m, marginBottom: m, marginLeft: m }
  if (mx) {
    margin['marginLeft'] = mx
    margin['marginRight'] = mx
  }
  if (my) {
    margin['marginTop'] = my
    margin['marginBottom'] = my
  }
  if (mt) margin['marginTop'] = mt
  if (mr) margin['marginRight'] = mr
  if (mb) margin['marginBottom'] = mb
  if (ml) margin['marginLeft'] = ml

  let padding = { paddingTop: 0, paddingRight: 0, paddingBottom: 0, paddingLeft: 0 }
  if (p) padding = { paddingTop: p, paddingRight: p, paddingBottom: p, paddingLeft: p }
  if (px) {
    padding['paddingLeft'] = px
    padding['paddingRight'] = px
  }
  if (py) {
    padding['paddingTop'] = py
    padding['paddingBottom'] = py
  }
  if (pt) padding['paddingTop'] = pt
  if (pr) padding['paddingRight'] = pr
  if (pb) padding['paddingBottom'] = pb
  if (pl) padding['paddingLeft'] = pl

  return <BoxInner margin={margin} padding={padding}>{children}</BoxInner>

}

export default Box
