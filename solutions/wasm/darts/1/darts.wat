(module
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $d f32)
    
    local.get $x 
    local.get $x
    f32.mul
    local.get $y
    local.get $y
    f32.mul
    f32.add
    f32.sqrt
    local.set $d

    local.get $d
    f32.const 10
    f32.gt
    ;;if distance > 10
    (if
      (then
        i32.const 0
        return
      )
    )
    ;;if 5 < distance <= 10
    local.get $d
    f32.const 5
    f32.gt
    (if 
      (then
        i32.const 1
        return
      )
    )
    ;;distance > 1 ? 5 : 10
    i32.const 5
    i32.const 10

    local.get $d
    f32.const 1
    f32.gt
    select
    return
  )
)
