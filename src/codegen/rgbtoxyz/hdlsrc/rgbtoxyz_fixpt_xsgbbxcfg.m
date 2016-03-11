
 function rgbtoxyz_fixpt_xsgbbxcfg(this_block)
 % Set target language
 this_block.setTopLevelLanguage('Verilog');
 % Set top entity name
 this_block.setEntityName('rgbtoxyz_fixpt');
 % Set the combinational flag
 this_block.tagAsCombinational;
 % Set inport names
 this_block.addSimulinkInport('reset');
 this_block.addSimulinkInport('r');
 this_block.addSimulinkInport('g');
 this_block.addSimulinkInport('b');
 % Set outport names and types
 this_block.addSimulinkOutport('ce_out');
 ce_out_obj = this_block.port('ce_out');
 ce_out_obj.setType('UFix_1_0');
 this_block.port('ce_out').useHDLVector(false);
 this_block.addSimulinkOutport('x');
 x_obj = this_block.port('x');
 x_obj.setType('UFix_8_0');
 this_block.addSimulinkOutport('y');
 y_obj = this_block.port('y');
 y_obj.setType('UFix_8_0');
 this_block.addSimulinkOutport('z');
 z_obj = this_block.port('z');
 z_obj.setType('UFix_8_0');
 % Set inport types and types are known
 if (this_block.inputTypesKnown)
	 if(this_block.port('reset').width ~= 1)
		 this_block.setError('Input data type for port "reset" must have width = 1.');
	 end
	 this_block.port('reset').useHDLVector(false);
	 if(this_block.port('r').width ~= 8)
		 this_block.setError('Input data type for port "r" must have width = 8.');
	 end
	 if(this_block.port('g').width ~= 8)
		 this_block.setError('Input data type for port "g" must have width = 8.');
	 end
	 if(this_block.port('b').width ~= 8)
		 this_block.setError('Input data type for port "b" must have width = 8.');
	 end
 end
 
 if (this_block.inputRatesKnown)
	 setup_rates(this_block,'clk','ce', 1);
 end
 %s Add HDL files
 this_block.addFile('C:\Users\Sechw\Documents\MATLAB\4440\codegen\rgbtoxyz\hdlsrc\rgbtoxyz_fixpt.v');
% ------------------------------------------------------------
function setup_rates(block,clkname,cename,upsamplerate) 
inputRates = block.inputRates; 
uniqueInputRates = unique(inputRates); 
if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
end 
if (uniqueInputRates(end) == Inf) 
    hasConstantInput = true; 
    uniqueInputRates = uniqueInputRates(1:end-1); 
end 
if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
end 
theInputRate = uniqueInputRates(1); 
for i = 1:block.numSimulinkOutports 
    block.outport(i).setRate(theInputRate); 
end 
block.addClkCEPair(clkname,cename,theInputRate/upsamplerate); 
return; 

% ------------------------------------------------------------
