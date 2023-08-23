<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Product;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;

class PizzaController extends AbstractController
{
    #[Route('/', name:'home')] // naar home pagina
    public function home(ManagerRegistry $doctrine) {
        $categories = $doctrine->getRepository(Category::class)->findAll();//   krijg alle gegevens van database Category;
        return $this->render('bezoeker/home.html.twig', ['categories'=>$categories]);// ga terug naar de homepagina en breng alle database van Category terug naar de homepagina;
    }

    #[Route('/product/{id}', name:'product')] // naar product pagina
    public function product(ManagerRegistry $doctrine, int $id):Response {
        $category = $doctrine->getRepository(Category::class)->find($id);// krij id van category;
        $products = $category->getProducts(); // laat product van category_ id tonen;
        return $this->render('bezoeker/product.html.twig',['products'=>$products]);
    }

    #[Route('/contact', name:'contact')] // naar contact pagina
    public function contact() {
        return $this->render('bezoeker/contact.html.twig');
    }

    #[Route('/login', name:'login')] // naar inloggen pagina
    public function login() {
        return $this->render('bezoeker/login.html.twig');
    }

    #[Route('/register', name:'register')] // naar inloggen pagina
    public function register() {
        return $this->render('bezoeker/register.html.twig');
    }

    #[Route('/order_view', name:'order_view')]
    public function View(ManagerRegistry $doctrine):Response {
        $orders = $doctrine->getRepository(Order::class)->findAll();
        return $this->render('bezoeker/order_view.html.twig',[
            'orders'=>$orders
        ]);
    }
}