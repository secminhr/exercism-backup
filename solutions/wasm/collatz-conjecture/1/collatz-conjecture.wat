(module
  (func (export "steps") (param $number i32) (result i32)
    (local $steps i32)
    (local.set $steps (i32.const 0))

    (if
      (i32.le_s (local.get $number) (i32.const 0))
      (then
        (return (i32.const -1))
      )
    )

    (loop $calculate
      (if
        (i32.ne (local.get $number) (i32.const 1))
        (then
          (local.set $steps (i32.add (local.get $steps) (i32.const 1)))
          (if
            (i32.eqz (i32.rem_u (local.get $number) (i32.const 2)))
            (then ;;even
              (local.set $number (i32.div_u (local.get $number) (i32.const 2)))
            )
            (else
              (i32.add (i32.mul (i32.const 3) (local.get $number)) (i32.const 1))
              local.set $number
            )
          )
          br $calculate
        )
      )
    )

    (return (local.get $steps))
  )
)