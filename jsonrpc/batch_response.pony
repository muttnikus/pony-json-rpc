class val BatchResponse
  let responses: Array[Response] val

  new val create(responses': Array[Response] val) =>
    responses = responses'

  fun box to_json(): String =>
    let s = recover trn String() end

    s.append("[")
    let iter = responses.values()
    while iter.has_next() do
      let res = try iter.next()?.to_json() else "\"ERROR\"" end
      s.append(res)
      if iter.has_next() then
        s.append(", ")
      end
    end
    s.append("]")

    consume s
