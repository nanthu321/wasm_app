## 1. Basic Structure

(module
  (func (param i32 i32) (result i32)
    ;; instructions here
  )
)


---

## 2. Constants


i32.const 10
i64.const 100
f32.const 3.14
f64.const 6.28


---

## 3. Arithmetic

### Integer


i32.add
i32.sub
i32.mul
i32.div_s
i32.div_u
i32.rem_s
i32.rem_u


### Float


f32.add
f32.sub
f32.mul
f32.div
f32.sqrt
f32.min
f32.max

---

## 4. Comparison

### Integer


i32.eq
i32.ne
i32.lt_s
i32.gt_s
i32.le_s
i32.ge_s

### Float


f32.eq
f32.ne
f32.lt
f32.gt
f32.le
f32.ge

---

## 5. Control Flow

### IF


(if (result i32)
  (then
    i32.const 1
  )
  (else
    i32.const 0
  )
)

### LOOP


(loop $loop
  br $loop
)

### BLOCK


(block $label
  br $label
)

### Branch


br 0
br_if 0

---

## 6. Local Variables


(local $x i32)

local.get $x
local.set $x
local.tee $x

---

## 7. Global Variables


(global $g (mut i32) (i32.const 10))

global.get $g
global.set $g

---

## 8. Memory

### Declare


(memory 1)

### Load / Store


i32.load
i32.store
i64.load
i64.store

---

## 9. Conversion


i32.wrap_i64
i64.extend_i32_s
f32.convert_i32_s
i32.trunc_f32_s

---

## 10. Function Call


(call $func)
call_indirect

---

## 11. Stack Helpers


drop
select

---

## 12. Import / Export


(import "env" "log" (func $log (param i32)))

(export "add" (func $add))

---

## 13. Example


(module
  (func $add (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.add
  )
  (export "add" (func $add))
)

