let wasmInstance;

document.addEventListener("DOMContentLoaded",async function(){
    loadWasm("main.wasm");
});


async function loadWasm(wasmFile) {
    const response  = await fetch(wasmFile);
    const bytes = await response.arrayBuffer();
    wasmInstance = await WebAssembly.instantiate(bytes);
}


const jsTimer = document.getElementById("time1");
const wasmTimer = document.getElementById("time2");

const btnJSFind = document.getElementById("btnJsFind");
const btnWasmFind = document.getElementById("btnWasmFind");

const inpNum1 = document.getElementById("input-num1")
const inpNum2 = document.getElementById("input-num2")
const inpNum3 = document.getElementById("input-num3")
const inpNum4 = document.getElementById("input-num4")

const result1 = document.getElementById("result1");
const result2 = document.getElementById("result2");


btnJSFind.addEventListener("click",()=>{
    const num1 = parseInt(inpNum1.value);
    const num2 = parseInt(inpNum2.value);
    
    const start = performance.now();
    
    let min;

 
    for(let i = 0; i < 1000000; i++) {
        min = (num1 < num2) ? num1 : num2; 
    }

    result1.innerText = min;

    const end = performance.now();
    
    jsTimer.innerText = `Time: ${(end - start).toFixed(4)} ms`;
    
});


btnWasmFind.addEventListener("click",()=>{
    const num1 = parseInt(inpNum3.value);
    const num2 = parseInt(inpNum4.value);
    
    const start = performance.now();
    
 
    const min = wasmInstance.instance.exports.find_min(num1, num2, 1000000);
    result2.innerText =  min;

    const end = performance.now();
    
    wasmTimer.innerText = `Time: ${(end - start).toFixed(4)} ms`;
    
});