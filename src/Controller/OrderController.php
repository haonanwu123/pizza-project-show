<?php

namespace App\Controller;

use App\Entity\Order;
use App\Form\OrdersType;
use App\Entity\Product;
use App\Repository\OrderRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

class OrderController extends AbstractController
{
    #[Route('/order/{id}', name:'order')]
    public function order(OrderRepository $orderRepository,Request $request, Product $orders): Response
    {

// just set up a fresh $order object (remove the example data)
        $order = new Order();
        $order->setProduct($orders);
        $productId = $orders->getId();
        $productName = $orders->getName();
        $productPrice = $orders->getPrice();
        $form = $this->createForm(OrdersType::class, $order);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
// $form->getData() holds the submitted values
// but, the original `$order` variable has also been updated
            $order = $form->getData();
            $orderRepository->save($order);


            return $this->redirectToRoute('order_view');
        }

        return $this->renderForm('bezoeker/order.html.twig', [
            'form' => $form,
            'productName' => $productName,
            'productPrice' => $productPrice,
        ]);
    }
}