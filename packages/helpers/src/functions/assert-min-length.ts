import type { ArrayAtLeastN } from "@/types"

export const assertMinLength = <T, L extends number>(
  arr: T[],
  length: L
): ArrayAtLeastN<T, L> => {
  if (arr.length < length)
    throw new TypeError(
      `Type assertion failed. arr.length should be gt ${length}, but get ${arr.length}`
    )
  return arr as unknown as ArrayAtLeastN<T, L>
}
