import type { Range } from "../types"

export const typedRange = <From extends number, To extends number>(
  from: From,
  to: To
): Range<From, To> =>
  Array.from({ length: to }, (_v, k) => k).filter((i) => i >= from) as Range<
    From,
    To
  >
