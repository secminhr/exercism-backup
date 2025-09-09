(module
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $d f32)
    
    (f32.sqrt
      (f32.add
        (f32.mul (local.get $x) (local.get $x))
        (f32.mul (local.get $y) (local.get $y))
      )
    )
    local.set $d

    ;;if distance > 10
    (if
      (f32.gt (local.get $d) (f32.const 10))
      (then
        i32.const 0
        return
      )
    )
    ;;if 5 < distance <= 10
    (if 
      (f32.gt (local.get $d) (f32.const 5))
      (then
        i32.const 1
        return
      )
    )
    ;;distance > 1 ? 5 : 10
    (select
      (i32.const 5)
      (i32.const 10)
      (f32.gt (local.get $d) (f32.const 1))
    )
    return
  )
)
