 json.array! @workers.each do |worker|
    json.partial! 'worker.json.builder', worker: worker
end