function checkComment()
{
  var comment = document.getElementById('content').value;
  if(comment == "")
  {
    alert('Vui long nhap comment truoc khi submit');
    return false;
  }

}

function checkOrder()
{
  var email = document.getElementById('email').value;
  var quantity = document.getElementById('quantity').value;
  if(email=="")
  {
    alert('Vui long nhap email');
    return false;
  }
  if(quantity=="")
  {
    alert('Vui long nhap so luong ve');
    return false;
  }
}

function checkSearch()
{
  var search = document.getElementById('search').value;
  if(search=="")
  {
    alert("Vui long nhap thong tin de tim kiem");
    return false;
  }
}
