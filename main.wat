(module
    (func $min (export "min") (param $num1 i32) (param $num2 i32) (result i32)
        ;; eg, parameters : num1 = 1, num2 = 2
        local.get $num1 ;; Its is push num1 from param to stack, so stack [1]
        local.get $num2 ;; Its is push num1 from param to stack, so stack [1,2]
        ;; now stack [1,2]
        ;; stack principle is last in first out 
        i32.lt_s ;; this is pop the last value of the stack(top)  and pop before last value , and compare reverese and if its true push 1 into stack else push 0 into stack, eg 1 < 2, true so, stack[1]
        (if (result i32) ;; here, if pop the stack value, that is 1, so stack [] and the value is 0 is false, 1 is true 
            (then
                local.get $num1 ;; push the num1 into stack 
            )
            (else
                local.get $num2 ;; push the num2 into stack 
            )
        )
    )

    (func $is_even (export "is_even") (param $num1 i32)  (result i32)

        local.get $num1
        i32.const 2
        ;;[1,2]
        i32.rem_s ;;[1]
        i32.const 0 ;;[0,1]
        i32.eq ;; [0]
       
        (if(result i32)
            (then
                i32.const 1
            )
            (else
                i32.const 0
            )
        )
    )


    (func $loop (export "loop") (param $n i32)
        ;;eg n = 2
        (local $i i32)  ;; default 0
        local.get $n  ;; [2]
        local.set $i  ;; pop n from stack and assing into so, i =2, stack =[]

        
        (loop $myLoop ;; like loop lable
            local.get $i ;; [2]
            i32.const 0 ;; [0,2]
            i32.gt_s ;; 2 > 0 , [1]
            (if ;; []
                (then
                    local.get $i  ;; [2]
                    i32.const 1 ;; [1,2]
                    i32.sub ;; 2 -1
                    local.set $i ;; i = 1, stack []
                    br $myLoop 
                )   
            )
           
        )
    )
    
    


    (func $find_min (export "find_min") (param $n1 i32) (param $n2 i32)(param $iteration i32) (result i32)
        (local $min i32)  ;; default 0
        (local $i i32)  ;; default 0
        i32.const 0 ;; push the 0 into stack for initializing i=0, stack[0]
        local.set $i ;; pop the stack value assign into i, so i=0, stack[]

        (loop $myLoop
            local.get $n1 ;; push n1 into stack , so [n1]
            local.get $n2 ;; push n2 into stack, so [n1,n2]
            i32.lt_s ;; its it pop the two value and compare if its true push 1 into stack or 0

            (if (result i32) ;; its pop the stack value if 1 means true 0 means false
                (then local.get $n1) ;; if true n1 is min, so push n1 into stack [n1]
                (else local.get $n2) ;; else n2 is min, so push n2 into stack [n2]
            )
            
            
            local.set $min ;; store the every iteration min value into local variable

            ;; increment i = i+1
            local.get $i ;; [i]
            i32.const 1 ;; [i,1]
            i32.add ;; i+1
            local.set $i ;; i = [sum of above] 

            ;; for check condition i < iteration
            local.get $i ;; [i]
            local.get $iteration ;; [i,iteration]
            i32.lt_s ;; i < iteration 

            br_if $myLoop ;; its pop the stack value if 1 goto loop else exit from loop 

        )
        local.get $min ;; finally put the min into stack that is return the answer
    )
)
   





